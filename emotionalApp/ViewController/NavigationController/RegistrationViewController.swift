//
//  RegistrationViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 08.11.2022.
//

import UIKit
import Locksmith

class RegistrationViewController: UIViewController {
    
    private var userDataStorageProtocol: UserDataStorageProtocol?
    private var userDataModel: UserDataModel?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var repeatPasswordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
    private enum Keys: String {
        case userData, name, age, login, email, password
    }
    
    @IBAction func registerActionButton(_ sender: UIButton) {
        if isValidInput() {
                    modelConstruction(name: nameTextField.text ?? "", age: ageTextField.text ?? "", login: loginTextField.text ?? "", email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
                    userDataStorageProtocol?.save(user: userDataModel!)
                    goToNextVC(vc: "SecondScreenViewController")
                } else {
                        showNoDataAlert()
                    }
    }
    
    override func viewDidLoad() {
            super.viewDidLoad()
            userDataModel = UserDataModel(name: "", age: "", login: "", email: "", password: "")
    //        userDataStorageProtocol = UserDataStorage()
    //        guard let dictionary = Locksmith.loadDataForUserAccount(userAccount: "b") else { return }
    //        print(dictionary)
        }
        
        // MARK: Alerts
        
        private func showNoDataAlert() {
            let alert = UIAlertController(
                title: "Ошибка",
                message: "Заполните все поля",
                preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default)

            alert.addAction(action)
            self.present(alert, animated: true)
        }
        
        private func showPasswordsDoNotMatch() {
            let alert = UIAlertController(
                title: "Ошибка",
                message: "Пароли не совпадают",
                preferredStyle: .alert)
            
            let action = UIAlertAction(title: "OK", style: .default)

            alert.addAction(action)
            self.present(alert, animated: true)
        }
     
        // MARK: Navigation Functions
        
        private func goToNextVC(vc: String) {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: vc) else { return }
            self.navigationController?.pushViewController(vc, animated: true)

        }
        
        // MARK: UserCheck Functions
        
        private func modelConstruction(name: String, age: String, login: String, email: String, password: String) {
            userDataModel?.name = name
            userDataModel?.age = age
            userDataModel?.login = login
            userDataModel?.email = email
            userDataModel?.password = password
        }
        
    //    private func store(model: UserDataProtocol) {
            
    //        if let name = nameTextField.text, let age = ageTextField.text, let login = loginTextField.text, let email = emailTextField.text, let password = passwordTextField.text {
                //        = UserDataModel(
                //            name: nameTextField.text ?? "",
                //            age: ageTextField.text ?? "",
                //            login: loginTextField.text ?? "",
                //            email: emailTextField.text ?? "",
                //            password: passwordTextField.text ?? "")
                
                //        guard let data = try? JSONEncoder().encode(currentUser) else {
                //            print("Невозможно собрать модель из currentUser")
                //            return
                //        }
                
                //        userDefaults.set(data, forKey: Keys.userData.rawValue)
    //            do {
    //                try Locksmith.saveData(data: ["name": name, "age": age, "login": login, "email": email, "password": password], forUserAccount: "MyAccount")
    //            } catch {
    //                print("Unable to save Data")
    //            }
    //        }
    //    }
        
    //    private func userCheck() -> UserDataModel {
    //                guard let data = userDefaults.data(forKey: Keys.userData.rawValue), let record = try? JSONDecoder().decode(UserDataModel.self, from: data) else {
    //                    return .init(name: "NO", age: "NO", login: "NO", email: "NO", password: "NO")
    //                }
    //                return record
    //    }
        
        private func isValidInput() -> Bool {
            var result = false
            if !nameTextField.text!.isEmpty {
                if !ageTextField.text!.isEmpty {
                    if !loginTextField.text!.isEmpty {
                        if !emailTextField.text!.isEmpty {
                            if !passwordTextField.text!.isEmpty {
                                if repeatPasswordTextField.text == passwordTextField.text {
                                    result = true
                                }
                            }
                        }
                    }
                }
            }
            return result
        }

    }
