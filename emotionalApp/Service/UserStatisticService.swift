//
//  UserStatisticService.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 09.11.2022.
//

import Foundation

protocol StatisticServiceProtocol {
    var name: String { get }
    var age: String { get }
    var login: String { get }
    var preferences: UserPreferencesDataModel { get set }
    
    func storePreferences(become happier: Bool, of stress: Bool, feel calmer: Bool, cope fears: Bool, analyze mood: Bool)
}

final class StatisticServiceImplementation: StatisticServiceProtocol {
    var name: String {
        get {
            return userDefaults.string(forKey: Preferences.name.rawValue) ?? "No name"
        }
        set {
            userDefaults.set(newValue, forKey: Preferences.name.rawValue)
        }
    }
    
    var age: String {
        get {
            return userDefaults.string(forKey: Preferences.age.rawValue) ?? "No age"
        }
        set {
            userDefaults.set(newValue, forKey: Preferences.age.rawValue)
        }
    }
    
    var login: String {
        get {
            return userDefaults.string(forKey: Preferences.login.rawValue) ?? "No login"
        }
        set {
            userDefaults.set(newValue, forKey: Preferences.login.rawValue)
        }
    }
    
    private var userDefaults = UserDefaults.standard
    
    private enum Preferences: String {
        case name, age, login, userPreferences
    }
    
    internal var preferences: UserPreferencesDataModel {
        get {
            guard let data = userDefaults.data(forKey: Preferences.userPreferences.rawValue), let record = try? JSONDecoder().decode(UserPreferencesDataModel.self, from: data) else {
                return .init(becomeHappier: false, getRidOfStress: false, feelCalmer: false, copeWithFears: false, analyzeMood: false)
            }
            return record
        }
        set {
            guard let data = try? JSONEncoder().encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            userDefaults.set(data, forKey: Preferences.userPreferences.rawValue)
        }
    }
    
    
    func storePreferences(become happier: Bool, of stress: Bool, feel calmer: Bool, cope fears: Bool, analyze mood: Bool) {
        let currentUser = UserPreferencesDataModel(
            becomeHappier: happier,
            getRidOfStress: stress,
            feelCalmer: calmer,
            copeWithFears: fears,
            analyzeMood: mood)
        
        guard let data = try? JSONEncoder().encode(currentUser) else {
            print("Невозможно собрать модель из currentUser")
            return
        }
        
        userDefaults.set(data, forKey: Preferences.userPreferences.rawValue)
    }
}
