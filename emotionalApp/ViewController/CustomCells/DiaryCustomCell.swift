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
    
    func set(note: MoodNote) {
        backgroundImage.image = note.backgroundImage
        dayLabel.text = note.day
        timeLabel.text = note.time
        moodImage.image = note.mood
        monthLabel.text = note.month
        moodDescription.text = note.moodDescription
        reasonsDescription.text = note.reasonsDescription
    }
    
}
