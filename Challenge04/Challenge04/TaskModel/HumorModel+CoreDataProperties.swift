//
//  HumorModel+CoreDataProperties.swift
//  Challenge04
//
//  Created by Anna Alicia Milani on 10/09/22.
//
//

import Foundation
import CoreData


extension HumorModel {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<HumorModel> {
        return NSFetchRequest<HumorModel>(entityName: "HumorModel")
    }

    @NSManaged public var data: Date?
    @NSManaged public var humor: String?

}

extension HumorModel : Identifiable {

}
