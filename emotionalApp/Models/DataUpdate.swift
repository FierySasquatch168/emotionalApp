//
//  DataUpdate.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 10.12.2022.
//

import Foundation

// Делегат настроения
protocol DataUpdateDelegate {
    func onDataUpdate(data: MoodNotes)
}

// Делегат причин настроения
protocol ReasonsUpdateDelegate {
    func saveNote(data: MoodNotes)
}

// Протокол передачи модели заметки между экранами
protocol UpdatingDataControllerProtocol: AnyObject {
    var updatingData: [MoodNotes] { get set }
    
}
