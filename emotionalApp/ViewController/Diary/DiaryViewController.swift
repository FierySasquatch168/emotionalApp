//
//  DiaryViewController.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 14.11.2022.
//

import UIKit
import CoreData

class DiaryViewController: UIViewController, DataUpdateDelegate {
    
    // Reference to managed context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    // Data for the table
//    var items: [MoodNote]?
    
    var updatedNotes: [MoodNote] = [] {
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
        tableView.separatorStyle = .none

        cellRegister()
        setBackgroundImage()
        
        setAddButtonStyle()
        
        // Get items from Core Data
        fetchNotes()
        
    }
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        let nextViewController = storyboardInstance.instantiateViewController(withIdentifier: "AddMoodViewController") as! AddMoodViewController
        
        // устанавливаем текущий класс в качестве делегата
        nextViewController.handleUpdatedDataDelegate = self
        
        // Открываем следующий экран
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    // MARK: Core data functionality
    
    func fetchNotes() {
        // Fetch the data from Core Data to display in the tableView
        do {
            
            let request = MoodNote.fetchRequest() as NSFetchRequest<MoodNote>
            
            // Set filtering and sorting on the request
//            let pred = NSPredicate(format: "name Contains %@", "Ted")
//            request.predicate = pred
            
            let sort = NSSortDescriptor(key: "day", ascending: true)
            request.sortDescriptors = [sort]
            
            self.updatedNotes = try context.fetch(request)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            
        }
        
    }
    
    // MARK: CustomCell registration
    
    private func cellRegister() {
        // регистрация кастомной ячейки
        let cellTypeNib = UINib(nibName: cellID, bundle: nil)
        tableView.register(cellTypeNib, forCellReuseIdentifier: cellID)
    }

    // MARK: Protocol method
    
    func onDataUpdate(data: MoodNote) {
        updatedNotes.append(data)
        
        // Save the data
        do {
            try self.context.save()
        }
        catch {
            
        }
        
        tableView.reloadData()
    }
    
    private func setBackgroundImage() {
        guard let image = UIImage(named: "Head") else { return }
        if updatedNotes.isEmpty {
            mainImageView.image = image
        } else {
            backgroundView.isHidden = true
        }
    }
    
    private func setAddButtonStyle() {
        guard let image = UIImage(named: "Plus Math") else { return }
        
        addbutton.setTitle("", for: .normal)
        addbutton.setImage(image, for: .normal)
        
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
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        // Create swipe action
        let action = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            
            // Which note to remove
            let noteToRemove = self.updatedNotes[indexPath.row]
            
            // Remove the note
            self.context.delete(noteToRemove)
            
            // Save the data
            do {
                try self.context.save()
            }
            catch {
                
            }
            
            // Re-fetch the data
            self.fetchNotes()
        }
        
        return UISwipeActionsConfiguration(actions: [action])
    }
    
}
