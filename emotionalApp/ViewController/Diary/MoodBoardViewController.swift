//
//  TestViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 16.11.2022.
//

import UIKit

class MoodBoardViewController: UIViewController {

    var updatingData: [MoodNotes] = []
    var test: UpdatingDataControllerProtocol?
    var chosenReasons = [String]()
    var reasonsDictionary: [UIButton : String] = [:]
    
    var handleUpdatedDataDelegate: ReasonsUpdateDelegate?
    
    @IBOutlet private weak var bottomImageView: UIImageView!
    @IBOutlet private weak var topImageView: UIImageView!
    
    @IBOutlet private weak var lowLabel: UILabel!
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var moodLabel: UILabel!
    
    @IBOutlet private weak var workButton: UIButton!
    @IBOutlet private weak var friendsButton: UIButton!
    @IBOutlet private weak var relaxButton: UIButton!
    @IBOutlet private weak var studyButton: UIButton!
    @IBOutlet private weak var loveButton: UIButton!
    @IBOutlet private weak var weatherButton: UIButton!
    @IBOutlet private weak var familyButton: UIButton!
    @IBOutlet private weak var vacationButton: UIButton!
    @IBOutlet private weak var saveButton: UIButton!
    
    @IBOutlet weak var mainTextField: UITextField!
    
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextField()
        setButtonCornerRadius()
        setMoodLabel()
        setTopImage()
        
        setButtonTitles()
        setButtonValues()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setDateAndTimeOfNote()
    }
    
    @IBAction func workButtonTapped(_ sender: UIButton) {
        chooseMood(sender)
        addMoodToData(sender)
    }
    
    @IBAction func friendsButtonTapped(_ sender: UIButton) {
        chooseMood(sender)
        addMoodToData(sender)
    }
    
    @IBAction func relaxButtonTapped(_ sender: UIButton) {
        chooseMood(sender)
        addMoodToData(sender)
    }
    
    @IBAction func studyButtonTapped(_ sender: UIButton) {
        chooseMood(sender)
        addMoodToData(sender)
    }
    
    @IBAction func loveButtonTapped(_ sender: UIButton) {
        chooseMood(sender)
        addMoodToData(sender)
    }
    
    @IBAction func weatherButtonTapped(_ sender: UIButton) {
        chooseMood(sender)
        addMoodToData(sender)
    }
    
    @IBAction func familyButtonTapped(_ sender: UIButton) {
        chooseMood(sender)
        addMoodToData(sender)
    }
    
    @IBAction func vacationButtonTapped(_ sender: UIButton) {
        chooseMood(sender)
        addMoodToData(sender)
    }
    
    // Переход от Б к А
    // Передача данных с помощью делегата
    @IBAction private func saveNote(_ sender: UIButton) {
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
            moodImage: updatingData[updatingData.count-1].moodImage,
            // TODO: Держать в уме порядок в массиве на случай ошибок при удалении
            backgroundImage: updatingData[updatingData.count-1].backgroundImage,
            moodDescription: updatingData[updatingData.count-1].moodDescription,
            reasonsDescription: chosenReasons.joined(separator: ", "))
        
        // Передаем данные делегату
        handleUpdatedDataDelegate?.saveNote(data: data)
                
        // Возвращаемся на предыдущий экран
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    private func setTextField() {
        mainTextField.placeholder = "Write down your thoughts"
    }
    
    private func setMoodLabel() {
        moodLabel.text = updatingData[updatingData.count-1].moodDescription
    }
    
    private func setTopImage() {
        topImageView.image = UIImage(named: moodLabel.text ?? "Close")
    }
    
    private func setButtonTitles() {
        workButton.setTitle("", for: .normal)
        friendsButton.setTitle("", for: .normal)
        relaxButton.setTitle("", for: .normal)
        weatherButton.setTitle("", for: .normal)
        studyButton.setTitle("", for: .normal)
        loveButton.setTitle("", for: .normal)
        familyButton.setTitle("", for: .normal)
        vacationButton.setTitle("", for: .normal)
    }
    
    private func setButtonValues() {
        reasonsDictionary = [workButton: "Work", friendsButton: "Friends", relaxButton: "Relax", weatherButton: "Weather", studyButton: "Study", loveButton: "Love", familyButton: "Family", vacationButton: "Vacation"]
    }
    
    private func setButtonCornerRadius() {
        workButton.layer.cornerRadius = 34
        friendsButton.layer.cornerRadius = 34
        relaxButton.layer.cornerRadius = 34
        weatherButton.layer.cornerRadius = 34
        studyButton.layer.cornerRadius = 34
        loveButton.layer.cornerRadius = 34
        familyButton.layer.cornerRadius = 34
        vacationButton.layer.cornerRadius = 34
        saveButton.layer.cornerRadius = 14
    }
    
    // Выбираем настроение
    private func chooseMood(_ sender: UIButton) {
        switch sender.layer.borderWidth {
        case 0:
            sender.layer.borderWidth = 3
            sender.layer.borderColor = UIColor.customPink?.cgColor
        case 3:
            sender.layer.borderWidth = 0
            sender.layer.borderColor = UIColor.clear.cgColor
        default:
            sender.layer.borderWidth = 0
        }
    }
    
    private func setDateAndTimeOfNote() {
        // Формируем дату в нужном виде
        let dayNow = Date()
        let dayFormatter = DateFormatter()
        dayFormatter.dateFormat = "dd"
        let day = dayFormatter.string(from: dayNow)
        
        let monthNow = Date()
        let monthFormatter = DateFormatter()
        monthFormatter.locale = Locale(identifier: "en_US")
        monthFormatter.dateFormat = "LLLL"
        let month = monthFormatter.string(from: monthNow)
        
        let timeNow = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let time = timeFormatter.string(from: timeNow)
        
        dateLabel.text = "today, \(month) \(day)\n at \(time)"
    }
    
    // Добавляем выбранное настроение в массив
    private func addMoodToData(_ sender: UIButton) {
        switch sender.layer.borderWidth {
        case 0:
            chosenReasons.removeAll(where: { $0 == reasonsDictionary[sender] ?? "" })
            print(chosenReasons)
        case 3:
            chosenReasons.append(reasonsDictionary[sender] ?? "SenderError")
            print(chosenReasons)
        default:
            sender.layer.borderWidth = 0
        }
    }
    
}
