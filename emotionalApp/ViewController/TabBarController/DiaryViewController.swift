//
//  DiaryViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import UIKit

class DiaryViewController: UIViewController {
    
   
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var addbutton: UIButton!
    
    @IBAction func addButtonAction(_ sender: Any) {
//        guard let vc = storyboard?.instantiateViewController(withIdentifier: "AddMoodViewController") else { return }
//        self.present(vc, animated: true)
//        let vc = UIViewController()
//        vc.view.backgroundColor = .systemPink
//        
//        navigationController?.pushViewController(vc, animated: true)
//
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainImageView.image = UIImage(named: "Head")
        
        addbutton.setTitle("", for: .normal)
        addbutton.setImage(UIImage(named: "Plus Math"), for: .normal)
        
        addbutton.frame.size.width = 70
        addbutton.frame.size.height = 70
        
        addbutton.layer.cornerRadius = 33
        addbutton.layer.masksToBounds = false
        
    }
}
