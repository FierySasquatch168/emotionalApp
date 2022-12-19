//
//  AddMoodViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import UIKit

class AddMoodViewController: UIViewController, ReasonsUpdateDelegate, UpdatingDataControllerProtocol {

    // Reference to managed context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Protocol conformance
    var updatingData: [MoodNote] = []
    var mood: UIImage?
    var backgroundImage: UIImage?
    var moodDescription: String?
    
    private let moodBackgroundChoice = ["Happy":"Rectangle 15", "Resentment":"Rectangle 14"]
    
    var storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    var handleUpdatedDataDelegate: DataUpdateDelegate?
    
    @IBOutlet private weak var pickerView: UIPickerView!
    @IBOutlet private weak var moodLabel: UILabel!
    
    private lazy var moodPickerModels: [MoodPickerModel] = {
        var models: [MoodPickerModel] = []
        
        for value in MoodModel.moods {
            models.append(.init(icon: value))
        }
        return models
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerViewSetup()
        moodLabel.text = "Happy"
    }
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "MoodBoardViewController") as! MoodBoardViewController
        
        // Формируем данные для передачи
        
        guard let moodLabelText = moodLabel.text, let moodImage = UIImage(named: moodLabelText), let actualBackgroundImage = UIImage(named: moodBackgroundChoice[moodLabelText]!) else { return }
        
        // передаем данные
        editScreen.mood = moodImage
        editScreen.backgroundImage = actualBackgroundImage
        editScreen.moodDescription = moodLabelText
        
        // устанавливаем текущий класс в качестве делегата
        editScreen.handleUpdatedDataDelegate = self
        
        // открываем следующий экран
        self.navigationController?.pushViewController(editScreen, animated: true)
    }
    
    @IBAction private func saveButtonTapped(_ sender: UIButton) {
        // Сохраняем заметку
        saveWithoutDetails()
    }
    
    // MARK: Private funcs
    
    private func saveWithoutDetails() {
        // Формируем дату в нужном виде
        let dayNow = Date()
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        let day = dayFormatter.string(from: dayNow)
        
        let monthNow = Date()
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "LLL"
        let month = monthFormatter.string(from: monthNow)
        
        let timeNow = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let time = timeFormatter.string(from: timeNow)
        
        // Формируем данные для передачи
        let newNote = MoodNote(context: self.context)
        newNote.day = day
        newNote.month = month
        newNote.time = time
        
        guard let moodLabelText = moodLabel.text, let moodImage = UIImage(named: moodLabelText), let backgroundImage = UIImage(named: moodBackgroundChoice[moodLabelText]!) else { return }
        
        newNote.mood = moodImage
        newNote.backgroundImage = backgroundImage
        newNote.moodDescription = moodLabelText
        newNote.reasonsDescription = "You preferred not to describe your feelings"
        
        // Передаем данные делегату
        handleUpdatedDataDelegate?.onDataUpdate(data: newNote)
        
        // Возвращаемся на предыдущий экран
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func saveNote(data: MoodNote) {

        // Передаем данные делегату
        handleUpdatedDataDelegate?.onDataUpdate(data: data)
        
        // Возвращаемся на предыдущий экран
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    // Выбираем настроение
    
    private func chooseMood(_ sender: UIButton) {
        switch sender.layer.borderWidth {
        case 0:
            sender.layer.borderWidth = 3
            sender.layer.borderColor = UIColor.blue.cgColor
        case 3:
            sender.layer.borderWidth = 0
            sender.layer.borderColor = UIColor.clear.cgColor
        default:
            sender.layer.borderWidth = 0
        }
    }
    
}



extension AddMoodViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return moodPickerModels.count
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 300.0
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 300.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let model = moodPickerModels[row]
        return MoodImageView.create(icon: model.icon)
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        pickerView.subviews[1].backgroundColor = .clear
        
        let model = moodPickerModels[row]
        
        switch model.icon {
        case UIImage(named: "Happy"):
            moodLabel.text = "Happy"
        case UIImage(named: "Resentment"):
            moodLabel.text = "Resentment"
        default: moodLabel.text = "Name Error"
        }
    }
}

private extension AddMoodViewController {
    func pickerViewSetup() {
        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.subviews[1].backgroundColor = .clear
    }
}

