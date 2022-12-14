//
//  DiaryViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import UIKit

class DiaryViewController: UIViewController, DataUpdateDelegate {
    
    var updatedNotes: [MoodNotes] = [] {
        didSet {
            setBackgroundImage()
        }
    }
    
    var storyboardInstance = UIStoryboard(name: "Main", bundle: nil)
    var cellID = "DiaryCustomCell"
   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var addbutton: UIButton!
    
    @IBOutlet weak var backgroundView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        cellRegister()
        setBackgroundImage()
        
        setAddButtonStyle()
        
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "AddMoodViewController") as! AddMoodViewController
        
        // устанавливаем текущий класс в качестве делегата
        nextViewController.handleUpdatedDataDelegate = self
        
        // Открываем следующий экран
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: CustomCell registration
    
    private func cellRegister() {
        // регистрация кастомной ячейки
        let cellTypeNib = UINib(nibName: cellID, bundle: nil)
        tableView.register(cellTypeNib, forCellReuseIdentifier: cellID)
    }

    // MARK: Protocol method
    
    func onDataUpdate(data: MoodNotes) {
        updatedNotes.append(data)
        tableView.reloadData()
    }
    
    func setBackgroundImage() {
        if updatedNotes.isEmpty {
            mainImageView.image = UIImage(named: "Head")
        } else {
            backgroundView.isHidden = true
        }
    }
    
    private func setAddButtonStyle() {
        addbutton.setTitle("", for: .normal)
        addbutton.setImage(UIImage(named: "Plus Math"), for: .normal)
        
        addbutton.frame.size.width = 70
        addbutton.frame.size.height = 70
        
        addbutton.layer.cornerRadius = 33
    }
    
}

// MARK: Extensions

extension DiaryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! DiaryCustomCell
        let note = updatedNotes[indexPath.row]
        cell.set(note: note)
        
        return cell
    }

    // количество строк в определенной секции
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return updatedNotes.count
    }
    
}
