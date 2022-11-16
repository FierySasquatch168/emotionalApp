//
//  File.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import Foundation

struct UserDataModel: Codable {
    var name: String
    var age: String
    var login: String
    var email: String
    var password: String
    
    init(name: String, age: String, login: String, email: String, password: String) {
        self.name = name
        self.age = age
        self.login = login
        self.email = email
        self.password = password
    }
}
