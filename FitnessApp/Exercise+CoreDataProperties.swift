//
//  Exercise+CoreDataProperties.swift
//  
//
//  Created by Rodrigo Colozio on 05/06/23.
//
//

import Foundation
import CoreData


extension Exercise {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercise> {
        return NSFetchRequest<Exercise>(entityName: "Exercise")
    }

    @NSManaged public var exerciseName: String?
    @NSManaged public var repetitions: String?
    @NSManaged public var execution: String?

}
