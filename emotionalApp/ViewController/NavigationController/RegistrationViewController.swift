//
//  RegistrationViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 08.11.2022.
//

import UIKit
import Locksmith

class RegistrationViewController: UIViewController {
    
    private var userDefaults = UserDefaults.standard
    private var userData: UserDataModel?
    
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
        registrationCheck()
//        goToNextVC(vc: "SecondScreenViewController")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func goToNextVC(vc: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: vc) else { return }
        // с возможностью вернуться на предыдущую страницу
        self.navigationController?.pushViewController(vc, animated: true)
        
        // без возможности вернуться
        // self.present(vc, animated: true)
    }
    
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
    
    private func store(name: String, age: String, login: String, email: String, password: String) {
        if let name = nameTextField.text, let age = ageTextField.text, let login = loginTextField.text, let email = emailTextField.text, let password = passwordTextField.text {
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
            do {
                try Locksmith.saveData(data: ["name": name, "age": age, "login": login, "email": email, "password": password], forUserAccount: loginTextField.text ?? "NoUser")
            } catch {
                print("Unable to save Data")
            }
        }
    }
    
    private func userCheck() -> UserDataModel {
                guard let data = userDefaults.data(forKey: Keys.userData.rawValue), let record = try? JSONDecoder().decode(UserDataModel.self, from: data) else {
                    return .init(name: "NO", age: "NO", login: "NO", email: "NO", password: "NO")
                }
                return record
//        guard let dictionary = Locksmith.loadDataForUserAccount(userAccount: "MyAccount") else {
//            return
//        }
//        return dictionary
    }
    
    private func registrationCheck() {
        if !nameTextField.text!.isEmpty && !ageTextField.text!.isEmpty && !loginTextField.text!.isEmpty && !emailTextField.text!.isEmpty && !passwordTextField.text!.isEmpty && repeatPasswordTextField.text == passwordTextField.text {
            store(name: nameTextField.text!, age: ageTextField.text!, login: loginTextField.text!, email: emailTextField.text!, password: passwordTextField.text!)
            goToNextVC(vc: "SecondScreenViewController")
            print("\(userCheck())")
        } else {
                showNoDataAlert()
        }
    }

}
