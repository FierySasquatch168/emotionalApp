//
//  MoodModel.swift
//  emotionalApp
//
//  Created by Aleksandr Eliseev on 10.12.2022.
//

import UIKit
import CoreData

@objc(MoodNote)
public class MoodNote: NSManagedObject {
   
}

extension MoodNote {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MoodNote> {
        return NSFetchRequest<MoodNote>(entityName: "MoodNote")
    }

    @NSManaged public var day: String?
    @NSManaged public var month: String?
    @NSManaged public var time: String?
    @NSManaged public var mood: UIImage?
    @NSManaged public var backgroundImage: UIImage?
    @NSManaged public var moodDescription: String?
    @NSManaged public var reasonsDescription: String?

}

extension MoodNote : Identifiable {

}
