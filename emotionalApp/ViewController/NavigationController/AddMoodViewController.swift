//
//  AddMoodViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import UIKit

class AddMoodViewController: UIViewController {

    
    @IBOutlet private weak var addButton: UIButton!
    @IBOutlet private weak var saveButton: UIButton!
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
        
        let label = moodLabel
        let model = moodPickerModels[row]
        
        switch model.icon {
        case UIImage(named: "Happy"):
            label?.text = "Happy"
        case UIImage(named: "Resentment"):
            label?.text = "Resentment"
        default: label?.text = "Name Error"
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

