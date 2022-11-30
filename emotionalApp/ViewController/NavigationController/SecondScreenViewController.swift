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
    
//    private var preferencesArray: [String : Bool] = [Preferences.becomeHappier.rawValue: false, Preferences.getRidOfStress.rawValue: false, Preferences.feelCalmer.rawValue: false, Preferences.copeWithFears.rawValue: false, Preferences.analyzeMood.rawValue: false]
    
    private enum Preferences: String {
        case becomeHappier, getRidOfStress, feelCalmer, copeWithFears, analyzeMood, userPreferences
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userStatistic = StatisticServiceImplementation()
        setButtonColor()
    }
    
    @IBAction func becomeHappierButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
        happier = becomeHappierButton.layer.borderWidth == 0 ? false : true
    }
    
    @IBAction func ridOfStressButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
        noStress = ridOfStressButton.layer.borderWidth == 0 ? false : true
    }
    
    @IBAction func feelCalmerButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
        calmer = feelCalmerButton.layer.borderWidth == 0 ? false : true
    }
    
    @IBAction func copeWithFearsButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
        noFears = copeWithFearsButton.layer.borderWidth == 0 ? false : true
    }
    
    @IBAction func analyzeMoodButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
        mood = analyzeMoodButton.layer.borderWidth == 0 ? false : true
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        userStatistic?.storePreferences(become: happier, of: noStress, feel: calmer, cope: noFears, analyze: mood)
        goToNextVC(vc: "TimePickScreenViewController")
        print("\(preferenceCheck())")
    }
    
    private func buttonTap(button: UIButton) {
        switch button.layer.borderWidth {
        case 0:
            button.layer.borderWidth = 1;
            button.layer.borderColor = UIColor.customPink?.cgColor;
        case 1:
            button.layer.borderWidth = 0;
        default: button.layer.borderWidth = 0
        }
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
