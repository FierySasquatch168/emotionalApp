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
        
        switch becomeHappierButton.backgroundColor {
        case UIColor.customGray: becomeHappierButton.backgroundColor = .customBlue
        case UIColor.customBlue: becomeHappierButton.backgroundColor = .customGray
        default: becomeHappierButton.backgroundColor = .customGray
        }
        
        if becomeHappierButton.backgroundColor == .customGray {
            happier = false
        } else {
            happier = true
        }
    }
    
    @IBAction func ridOfStressButtonTapped(_ sender: UIButton) {
        
        switch ridOfStressButton.backgroundColor {
        case UIColor.customGray: ridOfStressButton.backgroundColor = .customBlue
        case UIColor.customBlue: ridOfStressButton.backgroundColor = .customGray
        default: ridOfStressButton.backgroundColor = .customGray
        }
        
        if ridOfStressButton.backgroundColor == .customGray {
            noStress = false
        } else {
            noStress = true
        }
    }
    
    @IBAction func feelCalmerButtonTapped(_ sender: UIButton) {
        
        switch feelCalmerButton.backgroundColor {
        case UIColor.customGray: feelCalmerButton.backgroundColor = .customBlue
        case UIColor.customBlue: feelCalmerButton.backgroundColor = .customGray
        default: feelCalmerButton.backgroundColor = .customGray
        }
        
        if feelCalmerButton.backgroundColor == .customGray {
            calmer = false
        } else {
            calmer = true
        }
    }
    
    @IBAction func copeWithFearsButtonTapped(_ sender: UIButton) {
        
        switch copeWithFearsButton.backgroundColor {
        case UIColor.customGray: copeWithFearsButton.backgroundColor = .customBlue
        case UIColor.customBlue: copeWithFearsButton.backgroundColor = .customGray
        default: copeWithFearsButton.backgroundColor = .customGray
        }
        
        if copeWithFearsButton.backgroundColor == .customGray {
            noFears = false
        } else {
            noFears = true
        }
    }
    
    @IBAction func analyzeMoodButtonTapped(_ sender: UIButton) {
        
        switch analyzeMoodButton.backgroundColor {
        case UIColor.customGray: analyzeMoodButton.backgroundColor = .customBlue
        case UIColor.customBlue: analyzeMoodButton.backgroundColor = .customGray
        default: analyzeMoodButton.backgroundColor = .customGray
        }
        
        if analyzeMoodButton.backgroundColor == .customGray {
            mood = false
        } else {
            mood = true
        }
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        userStatistic?.storePreferences(become: happier, of: noStress, feel: calmer, cope: noFears, analyze: mood)
        print("\(preferenceCheck())")
    }
    
    // TODO: Не сохраняет модель, надо проверить
    
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
