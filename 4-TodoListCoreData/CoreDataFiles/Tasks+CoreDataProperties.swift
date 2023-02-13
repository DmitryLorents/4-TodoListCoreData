//
//  Tasks+CoreDataProperties.swift
//  4-TodoListCoreData
//
//  Created by Mac on 13.02.2023.
//
//

import Foundation
import CoreData


extension Tasks {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

    @NSManaged public var title: String?

}

extension Tasks : Identifiable {

}
