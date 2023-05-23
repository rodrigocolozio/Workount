//
//  Exercise.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 22/05/23.
//

import Foundation

public class Exercise {
    
    var exerciseName: String
    var repetitions: String
    var execution: String
    
    
    init(exerciseName: String, repetitions: String, execution: String) {
        self.exerciseName = exerciseName
        self.repetitions = repetitions
        self.execution = execution
    }
    
}
