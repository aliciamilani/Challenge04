//
//  ArrayDaily+CoreDataProperties.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 13/09/22.
//
//

import Foundation
import CoreData


extension ArrayDaily {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ArrayDaily> {
        return NSFetchRequest<ArrayDaily>(entityName: "ArrayDaily")
    }

    @NSManaged public var content: [TaskModel]

}

extension ArrayDaily : Identifiable {

}
