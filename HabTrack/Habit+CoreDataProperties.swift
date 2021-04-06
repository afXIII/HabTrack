//
//  Habit+CoreDataProperties.swift
//  HabTrack
//
//  Created by AL3 on 4/6/21.
//
//

import Foundation
import CoreData


extension Habit {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Habit> {
        return NSFetchRequest<Habit>(entityName: "Habit")
    }

    @NSManaged public var color_alpha: Double
    @NSManaged public var color_blue: Double
    @NSManaged public var color_green: Double
    @NSManaged public var color_red: Double
    @NSManaged public var goal: Int16
    @NSManaged public var name: String
    @NSManaged public var streak: Int16
    @NSManaged public var type: String

}

extension Habit : Identifiable {

}
