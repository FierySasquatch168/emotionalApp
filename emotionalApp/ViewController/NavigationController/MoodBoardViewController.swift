//
//  TestViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 16.11.2022.
//

import UIKit

class MoodBoardViewController: UIViewController {

    @IBOutlet private weak var saveButton: UIButton!
    
    @IBOutlet weak var bottomImageView: UIImageView!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    @IBOutlet weak var whiteBoardImageView: UIImageView!
    
    @IBOutlet weak var workButton: UIButton!
    @IBOutlet weak var friendsButton: UIButton!
    @IBOutlet weak var relaxButton: UIButton!
    @IBOutlet weak var studyButton: UIButton!
    @IBOutlet weak var loveButton: UIButton!
    @IBOutlet weak var weatherButton: UIButton!
    @IBOutlet weak var familyButton: UIButton!
    @IBOutlet weak var vacationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bottomImageView.image = UIImage(named: "Rectangle 12")
        topImageView.image = UIImage(named: "Happy")
        
        buttonSetup(button: workButton)
        buttonSetup(button: friendsButton)
        buttonSetup(button: relaxButton)
        buttonSetup(button: studyButton)
        buttonSetup(button: loveButton)
        buttonSetup(button: weatherButton)
        buttonSetup(button: familyButton)
        buttonSetup(button: vacationButton)

        checkMood()
    }
    
    
    @IBAction func workButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
    }
    
    @IBAction func friendsButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
    }
    
    @IBAction func relaxButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
    }
    
    @IBAction func studyButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
    }
    
    @IBAction func loveButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
    }
    
    @IBAction func weatherButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
    }
    
    @IBAction func familyButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
    }
    
    @IBAction func vacationButtonTapped(_ sender: UIButton) {
        buttonTap(button: sender)
    }
    
    private func buttonTap(button: UIButton) {
        switch button.layer.borderWidth {
        case 0:
            button.layer.borderWidth = 3;
            button.layer.borderColor = UIColor.customPink?.cgColor;
        case 1:
            button.layer.borderWidth = 0;
        default: button.layer.borderWidth = 0
        }
    }

    private func checkMood() {
        if topImageView.image == UIImage(named: "Happy") {
            moodLabel.text = "Happy"
        }
        else {
            moodLabel.text = "Resentment"
        }
    }
    
    private func buttonSetup(button: UIButton) {
        button.setTitle("", for: .normal)
        button.layer.cornerRadius = 34
    }
    
}
