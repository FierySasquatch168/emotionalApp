//
//  MoodModel.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 16.11.2022.
//

import UIKit

struct MoodPickerModel {
    let icon: UIImage
}

final class MoodModel {
    static var moods = [UIImage] (
        arrayLiteral: UIImage(named: "Happy") ?? UIImage(),
        UIImage(named: "Resentment") ?? UIImage())
}
