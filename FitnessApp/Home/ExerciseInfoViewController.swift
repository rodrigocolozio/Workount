//
//  ExerciseInfoViewController.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 22/05/23.
//

import UIKit


class ExerciseInfoViewController: UIViewController {
    
    // MARK: - Attributes
    let exercise = UILabel()
    let exerciseFromUser = UILabel()
    let repetitions = UILabel()
    let repsFromUser = UILabel()
    let execution = UILabel()
    let executionFromUser = UILabel()
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Exercise"
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground

        style()
        layout()
    }
}

    // MARK: - Style and layout
extension ExerciseInfoViewController {
    
    func style() {
        exercise.translatesAutoresizingMaskIntoConstraints = false
        exercise.text = "Exercise: "
        exercise.font = .systemFont(ofSize: 22, weight: .semibold)
        
        exerciseFromUser.translatesAutoresizingMaskIntoConstraints = false
        exerciseFromUser.numberOfLines = 0
        exerciseFromUser.font = .systemFont(ofSize: 22, weight: .semibold)
        
        repetitions.translatesAutoresizingMaskIntoConstraints = false
        repetitions.text = "Sets: "
        repetitions.font = .systemFont(ofSize: 22, weight: .semibold)
        
        repsFromUser.translatesAutoresizingMaskIntoConstraints = false
        repsFromUser.font = .systemFont(ofSize: 22, weight: .semibold)
        
        execution.translatesAutoresizingMaskIntoConstraints = false
        execution.text = "Execution: "
        execution.font = .systemFont(ofSize: 22, weight: .semibold)
        
        executionFromUser.translatesAutoresizingMaskIntoConstraints = false
        executionFromUser.font = .systemFont(ofSize: 19, weight: .regular)
        executionFromUser.numberOfLines = 0
        executionFromUser.textAlignment = .justified
        
    }
    
    func layout() {
        self.view.addSubview(exercise)
        self.view.addSubview(exerciseFromUser)
        self.view.addSubview(repetitions)
        self.view.addSubview(repsFromUser)
        self.view.addSubview(execution)
        self.view.addSubview(executionFromUser)
        
        NSLayoutConstraint.activate([
                //Exercise Label
            exercise.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            exercise.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            exercise.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -250),

            exerciseFromUser.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
            exerciseFromUser.leadingAnchor.constraint(equalTo: self.exercise.trailingAnchor, constant: 10),
            exerciseFromUser.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            repetitions.topAnchor.constraint(equalTo: self.exerciseFromUser.bottomAnchor, constant: 25),
            repetitions.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            repetitions.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -250),
            
            repsFromUser.topAnchor.constraint(equalTo: self.exerciseFromUser.bottomAnchor, constant: 25),
            repsFromUser.leadingAnchor.constraint(equalTo: self.repetitions.trailingAnchor, constant: 10),
            repsFromUser.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            
            execution.topAnchor.constraint(equalTo: self.repsFromUser.bottomAnchor, constant: 25),
            execution.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            execution.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -250),
            
            executionFromUser.topAnchor.constraint(equalTo: self.repsFromUser.bottomAnchor, constant: 25),
            executionFromUser.leadingAnchor.constraint(equalTo: self.execution.trailingAnchor, constant: 10),
            executionFromUser.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            

        
        ])
    }
}
