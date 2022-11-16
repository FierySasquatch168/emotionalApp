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
    @IBOutlet weak var buttonStack: UIStackView!
    @IBOutlet weak var lowLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var moodLabel: UILabel!
    @IBOutlet weak var topImageView: UIImageView!
    
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
        
        workButton.setTitle("", for: .normal)
        workButton.layer.cornerRadius = 34
        
        friendsButton.setTitle("", for: .normal)
        friendsButton.layer.cornerRadius = 34
        
        relaxButton.setTitle("", for: .normal)
        relaxButton.layer.cornerRadius = 34
        
        studyButton.setTitle("", for: .normal)
        studyButton.layer.cornerRadius = 34
        
        loveButton.setTitle("", for: .normal)
        loveButton.layer.cornerRadius = 34
        
        weatherButton.setTitle("", for: .normal)
        weatherButton.layer.cornerRadius = 34
        
        familyButton.setTitle("", for: .normal)
        familyButton.layer.cornerRadius = 34
        
        vacationButton.setTitle("", for: .normal)
        vacationButton.layer.cornerRadius = 34

        checkMood()
    }
    
    private func checkMood() {
        if topImageView.image == UIImage(named: "Happy") {
            moodLabel.text = "Happy"
        }
        else {
            moodLabel.text = "Resentment"
        }
    }
}
