//
//  File.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import Foundation
import Locksmith

protocol UserDataProtocol {
    var name: String { get set }
    var age: String { get set }
    var login: String { get set }
    var email: String { get set }
    var password: String { get set }
}

protocol UserDataStorageProtocol {
    func save(user: UserDataModel)
    func load()
}

struct UserDataModel: UserDataProtocol, Codable {
    var name: String
    var age: String
    var login: String
    var email: String
    var password: String
}

class UserDataStorage: UserDataStorageProtocol {
    
    func load() {
        guard let dictionary = Locksmith.loadDataForUserAccount(userAccount: "MyAccount") else { return }
        print(dictionary)
    }
    
    func save(user: UserDataModel) {
            do {
                try Locksmith.saveData(data: ["name": user.name, "age": user.age, "login": user.login, "email": user.email, "password": user.password], forUserAccount: user.login)
            } catch {
                print("Unable to save Data")
            }
        }
    }
    
//}
