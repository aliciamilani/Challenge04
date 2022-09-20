//
//  TaskModel+CoreDataProperties.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 08/09/22.
//
//

import Foundation
import CoreData


extension TaskModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TaskModel> {
        return NSFetchRequest<TaskModel>(entityName: "TaskModel")
    }

    @NSManaged public var category: Int16
    @NSManaged public var difficulty: Int16
    @NSManaged public var duration: Int16
    @NSManaged public var goal: Int16
    @NSManaged public var points: Float
    @NSManaged public var title: String?

}

extension TaskModel : Identifiable {

}
