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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logInTextField.layer.borderWidth = 1
        logInTextField.layer.cornerRadius = 32
        passwordTextField.layer.borderWidth = 1
        passwordTextField.layer.cornerRadius = 32
    }
}

