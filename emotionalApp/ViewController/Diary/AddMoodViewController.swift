//
//  AddMoodViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import UIKit

class AddMoodViewController: UIViewController, ReasonsUpdateDelegate {

    var updatingData: [MoodNotes] = []
    
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
        setup()
        moodLabel.text = "Happy"
    }
    
    @IBAction private func addButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let editScreen = storyboard.instantiateViewController(withIdentifier: "MoodBoardViewController") as! MoodBoardViewController
        
        let currentMood = moodLabel.text!
        let data = MoodNotes(
            dayLabel: "",
            monthLabel: "",
            timeLabel: "",
            moodImage: (((moodLabel.text?.contains("Happy"))! ? UIImage(named: "Happy") : UIImage(named: "Resentment"))!),
            backgroundImage: (((moodLabel.text?.contains("Happy"))! ? UIImage(named: "Rectangle 15") : UIImage(named: "Rectangle 14"))!),
            moodDescription: currentMood,
            reasonsDescription: "")
        
        updatingData.append(data)
        
        // передаем данные
        editScreen.updatingData = updatingData
        
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
        let data = MoodNotes(
            dayLabel: day,
            monthLabel: month,
            timeLabel: time,
            moodImage: (((moodLabel.text?.contains("Happy"))! ? UIImage(named: "Happy") : UIImage(named: "Resentment"))!),
            backgroundImage: (((moodLabel.text?.contains("Happy"))! ? UIImage(named: "Rectangle 15") : UIImage(named: "Rectangle 14"))!),
            moodDescription: moodLabel.text!,
            reasonsDescription: "You preferred not to describe your feelings")
        
        // Передаем данные делегату
        handleUpdatedDataDelegate?.onDataUpdate(data: data)
        
        // Возвращаемся на предыдущий экран
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    func saveNote(data: MoodNotes) {

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
    func setup() {
        pickerView.delegate = self
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.subviews[1].backgroundColor = .clear
    }
}

