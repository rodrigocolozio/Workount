//
//  Exercise+CoreDataProperties.swift
//  
//
//  Created by Rodrigo Colozio on 29/05/23.
//
//

import Foundation
import CoreData


extension Exercises {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercises> {
        return NSFetchRequest<Exercises>(entityName: "Exercises")
    }

    @NSManaged public var exerciseName: String?
    @NSManaged public var repetitions: String?
    @NSManaged public var execution: String?

}
