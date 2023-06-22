//
//  AddExerciseViewController.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 23/05/23.
//

import UIKit


protocol AddExerciseDelegate: AnyObject {
    func add(exercise: Exercise)
}
class AddExerciseViewController: UIViewController {
    
    // MARK: - Attributes
    let exerciseView = ExerciseView()
    let confirmButton = UIButton(type: .system)
    
    var myExercises: [Exercise] = []
    
    weak var delegate: AddExerciseDelegate?

    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        style()
        layout()
        configureDismissKeyboard()
    }
}

extension AddExerciseViewController {
    
    func style() {
        exerciseView.translatesAutoresizingMaskIntoConstraints = false
        
        confirmButton.translatesAutoresizingMaskIntoConstraints = false
        confirmButton.setTitle("Confirm", for: .normal)
        confirmButton.backgroundColor = .systemBlue
        confirmButton.configuration = .filled()
        confirmButton.configuration?.imagePadding = 8
        confirmButton.addTarget(self, action: #selector(confirmButtonTapped), for: .primaryActionTriggered)
        confirmButton.layer.cornerRadius = 8
    }
    
    func layout() {
        view.addSubview(exerciseView)
        view.addSubview(confirmButton)
        
        NSLayoutConstraint.activate([
            exerciseView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 50),
            exerciseView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            exerciseView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            confirmButton.topAnchor.constraint(equalTo: self.exerciseView.bottomAnchor, constant: 50),
            confirmButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            confirmButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            confirmButton.heightAnchor.constraint(equalToConstant: 35)

            
        ])
    }
    
}

// MARK: - Actions
extension AddExerciseViewController {
    
    @objc func confirmButtonTapped() {
        print("confirm button was tapped")
        if let exercise = readingDataFromUser() {
            delegate?.add(exercise: exercise)
            dismiss(animated: true)
        } else {
            // create error alert
            let alert = UIAlertController(title: "Error", message: "You should fill out all of the spaces bellow", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            present(alert, animated: true)
        }
    }
    
    fileprivate func configureDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap);
    }
}

extension AddExerciseViewController {
    
    func readingDataFromUser() -> Exercise? {
        guard let exercise = exerciseView.exerciseTextField.text, let rep = exerciseView.repetitionsTextField.text, let execution = exerciseView.executionTextView.text, !exercise.isEmpty, !rep.isEmpty, !execution.isEmpty else { return nil }
        
       return CoreDataManager.shared.createExercise(exercise: exercise, repetitions: rep, execution: execution)
    }
}
