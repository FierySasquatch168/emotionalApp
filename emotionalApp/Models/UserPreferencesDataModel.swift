//
//  UserSettingData.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 08.11.2022.
//

import Foundation

struct UserPreferencesDataModel: Codable {
    var becomeHappier: Bool
    var getRidOfStress: Bool
    var feelCalmer: Bool
    var copeWithFears: Bool
    var analyzeMood: Bool
}
