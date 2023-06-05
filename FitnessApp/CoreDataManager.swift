//
//  CoreDataManager.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 05/06/23.
//

import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FitnessApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, err) in
            if let err = err {
                fatalError("Loading of stores failed: \(err)")
            }
        })
        return container
    }()
    
    
    // create Exercise
    func createExercise(exercise: String, repetitions: String, execution: String) -> Exercise {
        let context = persistentContainer.viewContext
        let newExercise = NSEntityDescription.insertNewObject(forEntityName: "Exercise", into: context) as! Exercise
        newExercise.exerciseName = exercise
        newExercise.repetitions = repetitions
        newExercise.execution = execution
        
        do {
            try context.save()
            return newExercise
        } catch let err{
            print("failed to create a new exercise:" , err)
            return newExercise
        }
    }
    // fetch exercise
    func fetchExercise() -> [Exercise] {
        let context = persistentContainer.viewContext
        let fetechedExercise = NSFetchRequest<Exercise>(entityName: "Exercise")
        
        do {
            let newExercise = try context.fetch(fetechedExercise)
            return newExercise
        } catch let err{
            print("failed to fetch exercise request", err)
            return []
        }
    }
    
    // delete exercise
    func deleteExercise(with exercise: Exercise) -> Bool {
        let context = persistentContainer.viewContext
        context.delete(exercise)
        
        do {
            try context.save()
            return true
        } catch let err{
            print("failed to delete the exercise from data:", err)
            return false
        }
    }
    
    // edit exercise
    
}
