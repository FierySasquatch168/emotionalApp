//
//  FourthScreenViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 07.11.2022.
//

import UIKit

class FourthScreenViewController: UIViewController {

    @IBOutlet weak var timePicker: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timePicker.dataSource = self
        timePicker.delegate = self


    }
}

extension FourthScreenViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        5
    }
}

extension FourthScreenViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "Component: \(component) Row: \(row)"
    }
}
