//
//  CustomCell.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 10.12.2022.
//

import UIKit

class DiaryCustomCell: UITableViewCell {

    
    
    
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var moodImage: UIImageView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var moodDescription: UILabel!
    @IBOutlet weak var reasonsDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    
    func set(note: MoodNotes) {
        backgroundImage.image = note.backgroundImage
        dayLabel.text = note.dayLabel
        timeLabel.text = note.timeLabel
        moodImage.image = note.moodImage
        monthLabel.text = note.monthLabel
        moodDescription.text = note.moodDescription
        reasonsDescription.text = note.reasonsDescription
    }
    
}
