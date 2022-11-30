//
//  ViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 12.10.2022.
//

import UIKit
import Locksmith

class ViewController: UIViewController {
    
    @IBOutlet weak var registrationButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var logInTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
   
    
    @IBAction func registrationActionButton(_ sender: Any) {
        goToNextVC(vc: "RegistrationViewController")
    }
    
    
    @IBAction func startButtonAction(_ sender: Any) {
        let dictionary = Locksmith.loadDataForUserAccount(userAccount: logInTextField.text ?? "")
               
                print(dictionary?.values)
                
                print(dictionary)
        //        userCheck()
                goToNextVC(vc: "TabBarViewController")
    }
    
    private var userDefaults = UserDefaults.standard
    
    private enum Keys: String {
        case userData
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        registerKeyboardNotification()
//        print("\(userRegistered())")
        logInTextField.layer.cornerRadius = 32
        passwordTextField.layer.cornerRadius = 32
    }
    
    // MARK: Private funcs
    
    private func goToNextVC(vc: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: vc) else { return }
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    // MARK: UserCheckFunc - переделать проверку с UserDefaults на KeyChain

    private func userRegistered() -> UserDataModel {
        guard let data = userDefaults.data(forKey: Keys.userData.rawValue), let record = try? JSONDecoder().decode(UserDataModel.self, from: data) else {
            return .init(name: "NO", age: "NO", login: "NO", email: "NO", password: "NO")
        }
        return record
    }

    private func userCheck() {
        //        guard let data = userDefaults.data(forKey: Keys.userData.rawValue),
        //                let record = try? JSONDecoder().decode(UserDataModel.self, from: data) else { return }
        guard let data = Locksmith.loadDataForUserAccount(userAccount: logInTextField.text ?? "") else { return }
        let wrappedData = Data(data.description.utf8)
        let record = try? JSONDecoder().decode(UserDataModel.self, from: wrappedData)
                
        // TODO: Данные сохранены, но как достать их для сравнения?
        
        if record?.login.lowercased() == logInTextField.text!.lowercased() && record?.password == passwordTextField.text { goToNextVC(vc: "TabBarViewController") }
        
        if record?.login.lowercased() == logInTextField.text?.lowercased() && record?.password != passwordTextField.text {
            showWrongPassword()
        }
        
        if logInTextField.text!.isEmpty {
            showNoData()
        } else { if record?.login.lowercased() != logInTextField.text!.lowercased() { showNoUser() } }
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
    
    private func showNoUserFound() {
        let alert = UIAlertController(
            title: "Ошибка",
            message: "Заполните все поля",
            preferredStyle: .alert)

        let action = UIAlertAction(title: "OK", style: .default)

        alert.addAction(action)
        self.present(alert, animated: true)
    }
    
}

//extension ViewController {
//    
//    private func registerKeyboardNotification() {
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyboardWillShow),
//                                               name: UIResponder.keyboardWillShowNotification,
//                                               object: nil)
//        
//        NotificationCenter.default.addObserver(self,
//                                               selector: #selector(keyboardWillHide),
//                                               name: UIResponder.keyboardWillShowNotification,
//                                               object: nil)
//    }
//    
//    
//    
//    @objc private func keyboardWillShow(notification: Notification) {
//        let userInfo = notification.userInfo
//        let keyboardHeight = (userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
//        scrollView.setContentOffset = CGPoint(x: 0, y: keyboardHeight.height / 2)
//    }
//    
//    @objc private func keyboardWillHide(notification: Notification) {
//        scrollView.setContentOffset = CGPoint.zero
//    }
//}
