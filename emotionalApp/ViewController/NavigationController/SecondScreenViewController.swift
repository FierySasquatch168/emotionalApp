//
//  SecondScreenViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 07.11.2022.
//

import UIKit

class SecondScreenViewController: UIViewController {
    
    @IBOutlet weak var becomeHappierButton: UIButton!
    @IBOutlet weak var ridOfStressButton: UIButton!
    @IBOutlet weak var feelCalmerButton: UIButton!
    @IBOutlet weak var copeWithFearsButton: UIButton!
    @IBOutlet weak var analyzeMoodButton: UIButton!
    
    private var userDefaults = UserDefaults.standard
    private var userStatistic: StatisticServiceProtocol?
    private var happier: Bool = false
    private var noStress: Bool = false
    private var calmer: Bool = false
    private var noFears: Bool = false
    private var mood: Bool = false
    
    private enum Preferences: String {
        case becomeHappier, getRidOfStress, feelCalmer, copeWithFears, analyzeMood, userPreferences
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userStatistic = StatisticServiceImplementation()
        setButtonColor()
    }
    
    @IBAction func becomeHappierButtonTapped(_ sender: UIButton) {
        
        switch becomeHappierButton.layer.borderWidth {
        case 0:
            becomeHappierButton.layer.borderWidth = 1;
            becomeHappierButton.layer.borderColor = UIColor.customPink?.cgColor;
            happier = true
        case 1:
            becomeHappierButton.layer.borderWidth = 0;
            happier = false
        default: becomeHappierButton.layer.borderWidth = 0
        }
    }
    
    @IBAction func ridOfStressButtonTapped(_ sender: UIButton) {
        
        switch ridOfStressButton.layer.borderWidth {
        case 0:
            ridOfStressButton.layer.borderWidth = 1;
            ridOfStressButton.layer.borderColor = UIColor.customPink?.cgColor;
            noStress = true
        case 1:
            ridOfStressButton.layer.borderWidth = 0;
            noStress = false
        default: ridOfStressButton.layer.borderWidth = 0
        }
    }
    
    @IBAction func feelCalmerButtonTapped(_ sender: UIButton) {
        
        switch feelCalmerButton.layer.borderWidth {
        case 0:
            feelCalmerButton.layer.borderWidth = 1;
            feelCalmerButton.layer.borderColor = UIColor.customPink?.cgColor;
            calmer = true
        case 1:
            feelCalmerButton.layer.borderWidth = 0;
            calmer = false
        default: feelCalmerButton.layer.borderWidth = 0
        }
    }
    
    @IBAction func copeWithFearsButtonTapped(_ sender: UIButton) {
        
        switch copeWithFearsButton.layer.borderWidth {
        case 0:
            copeWithFearsButton.layer.borderWidth = 1;
            copeWithFearsButton.layer.borderColor = UIColor.customPink?.cgColor;
            noFears = true
        case 1:
            copeWithFearsButton.layer.borderWidth = 0;
            noFears = false
        default: copeWithFearsButton.layer.borderWidth = 0
        }
    }
    
    @IBAction func analyzeMoodButtonTapped(_ sender: UIButton) {
        
        switch analyzeMoodButton.layer.borderWidth {
        case 0:
            analyzeMoodButton.layer.borderWidth = 1;
            analyzeMoodButton.layer.borderColor = UIColor.customPink?.cgColor;
            mood = true
        case 1:
            analyzeMoodButton.layer.borderWidth = 0;
            mood = false
        default: analyzeMoodButton.layer.borderWidth = 0
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        userStatistic?.storePreferences(become: happier, of: noStress, feel: calmer, cope: noFears, analyze: mood)
        goToNextVC(vc: "TimePickScreenViewController")
        print("\(preferenceCheck())")
    }
    
    private func goToNextVC(vc: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: vc) else { return }
        // с возможностью вернуться на предыдущую страницу
        navigationController?.pushViewController(vc, animated: true)
        
        // без возможности вернуться
        // self.present(vc, animated: true)
    }
    
    private func preferenceCheck() -> UserPreferencesDataModel {
        guard let data = userDefaults.data(forKey: Preferences.userPreferences.rawValue), let record = try? JSONDecoder().decode(UserPreferencesDataModel.self, from: data) else {
            return .init(becomeHappier: false, getRidOfStress: false, feelCalmer: false, copeWithFears: false, analyzeMood: false)
        }
        return record
    }
    
    private func setButtonColor() {
        becomeHappierButton.backgroundColor = .customGray
        ridOfStressButton.backgroundColor = .customGray
        feelCalmerButton.backgroundColor = .customGray
        copeWithFearsButton.backgroundColor = .customGray
        analyzeMoodButton.backgroundColor = .customGray
    }

    
}
