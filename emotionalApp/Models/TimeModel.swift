//
//  TimeModel.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 09.11.2022.
//

import Foundation

struct TimeModel: Codable {
    var time: String
    
    init(time: String) {
        self.time = time
    }
}
