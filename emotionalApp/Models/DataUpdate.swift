//
//  DataUpdate.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 10.12.2022.
//

import UIKit

// Делегат настроения
protocol DataUpdateDelegate {
    func onDataUpdate(data: MoodNote)
}

// Делегат причин настроения
protocol ReasonsUpdateDelegate {
    func saveNote(data: MoodNote)
}

// Протокол передачи модели заметки между экранами
protocol UpdatingDataControllerProtocol: AnyObject {
    var updatingData: [MoodNote] { get set }
    var mood: UIImage? { get set }
    var backgroundImage: UIImage? { get set }
    var moodDescription: String? { get set }
    
}
