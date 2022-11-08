//
//  ThirdScreenViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 07.11.2022.
//

import UIKit

class ThirdScreenViewController: UIViewController {
  

    @IBOutlet weak var firstTimeSlotButton: UIButton!
    @IBOutlet weak var secondTimeSlotButton: UIButton!
    @IBOutlet weak var thirdTimeSlotButton: UIButton!
    @IBOutlet weak var fourtTimeSlotButton: UIButton!
    @IBOutlet weak var otherTimeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        firstTimeSlotButton.layer.cornerRadius = 32
        secondTimeSlotButton.layer.cornerRadius = 32
        thirdTimeSlotButton.layer.cornerRadius = 32
        fourtTimeSlotButton.layer.cornerRadius = 32
        otherTimeButton.layer.cornerRadius = 32

    }
}
