//
//  ViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 12.10.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var logInTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBAction func startButtonAction(_ sender: Any) {
        userCheck()
    }
    
    private var userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case userData
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(userRegistered())")
        logInTextField.layer.borderWidth = 1
        logInTextField.layer.cornerRadius = 32
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 32
    }
    
    private func showNoUserFound() {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Заполните все поля",
            preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)

        alert.addAction(action)
        self.present(alert, animated: true)
    }

    private func userRegistered() -> UserDataModel {
        guard let data = userDefaults.data(forKey: Keys.userData.rawValue), let record = try? JSONDecoder().decode(UserDataModel.self, from: data) else {
            return .init(name: "NO", age: "NO", login: "NO", email: "NO", password: "NO")
        }
        return record
    }

    private func userCheck() {
        guard let data = userDefaults.data(forKey: Keys.userData.rawValue),
                let record = try? JSONDecoder().decode(UserDataModel.self, from: data) else { return }
//
        if record.login.lowercased() == logInTextField.text!.lowercased() && record.password == passwordTextField.text {
            guard let vc = storyboard?.instantiateViewController(withIdentifier: "SecondScreenViewController") else { return }
            // с возможностью вернуться на предыдущую страницу
            self.navigationController?.pushViewController(vc, animated: true) }

        if record.login.lowercased() == logInTextField.text?.lowercased() && record.password != passwordTextField.text {
            showWrongPassword()
        }

        if logInTextField.text!.isEmpty {
            showNoData()
        } else { if record.login.lowercased() != logInTextField.text!.lowercased() { showNoUser() } }
    }
    
    
//  MARK: Alerts

    private func showWrongPassword() {
        let alert = UIAlertController(
            title: "Неправильный пароль",
            message: "Проверьте введенный пароль",
            preferredStyle: .alert)

        let action = UIAlertAction(
            title: "OK",
            style: .default)

        alert.addAction(action)
        self.present(alert, animated: true)
    }

    private func showNoUser() {
        let alert = UIAlertController(
            title: "Пользователь не найден",
            message: "Проверьте login",
            preferredStyle: .alert)

        let action = UIAlertAction(
            title: "OK",
            style: .default)

        alert.addAction(action)
        self.present(alert, animated: true)
    }

    private func showNoData() {
        let alert = UIAlertController(
            title: "Залогиньтесь, пожалуйста",
            message: "Введите логин и пароль",
            preferredStyle: .alert)

        let action = UIAlertAction(
            title: "OK",
            style: .default)

        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}

