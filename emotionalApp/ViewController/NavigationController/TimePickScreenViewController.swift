//
//  FourthScreenViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 07.11.2022.
//

import UIKit

class TimePickScreenViewController: UIViewController {

    @IBOutlet weak var timePicker: UIDatePicker!
    @IBAction func nextButtonAction(_ sender: UIButton) {
        timeSelect()
//        print(timeSelect())
        goToNextVC(vc: "TabBarViewController")
    }
    
    private let timeStartFormatter = DateFormatter()
    private let userDefaults = UserDefaults.standard
    
    private func goToNextVC(vc: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: vc) else { return }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func timeSelect() {
        // TODO: Не сохраняет время в UserDefaults
        let time = timeStartFormatter.string(from: timePicker.date)
        print(time)
        guard let data = try? JSONEncoder().encode(time) else {
            print("Невозможно собрать модель из currentUser")
            return
        }
        
        userDefaults.set(data, forKey: time)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
