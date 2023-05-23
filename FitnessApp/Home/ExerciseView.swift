//
//  ExerciseInfoView.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 22/05/23.
//

import Foundation
import UIKit

public class ExerciseView: UIView {
    
    let stackView = UIStackView()
    let exerciseNameLabel = UILabel()
    let exerciseTextField = UITextField()
    let repetitionsLabel = UILabel()
    let repetitionsTextField = UITextField()
    let executionLabel = UILabel()
    let executionTextView = UITextView()
    
    let divider = UIView()
    
    
    
    /*
        Create the divider for all the componets above
     */
    
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ExerciseView {
    
    func style() {
        // stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 12
        
        //ExerciseName
        exerciseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        exerciseNameLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        exerciseNameLabel.text = "Exercise"
        exerciseNameLabel.textAlignment = .center
        
        //ExerciseTextField
        exerciseTextField.translatesAutoresizingMaskIntoConstraints = false
        exerciseTextField.placeholder = "Exercise name ..."
        exerciseTextField.layer.cornerRadius = 8
        exerciseTextField.backgroundColor = UIColor(red: 235, green: 235, blue: 235, alpha: 0.9)
        
        //RepetitionsLabel
        repetitionsLabel.translatesAutoresizingMaskIntoConstraints = false
        repetitionsLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        repetitionsLabel.text = "How many sets?"
        repetitionsLabel.textAlignment = .center
        
        //RepetitionsTextField
        repetitionsTextField.translatesAutoresizingMaskIntoConstraints = false
        repetitionsTextField.placeholder = "e.g: 4x10"
        repetitionsTextField.layer.cornerRadius = 8
        repetitionsTextField.backgroundColor = UIColor(red: 235, green: 235, blue: 235, alpha: 0.9)
        
        //Executionlabel
        executionLabel.translatesAutoresizingMaskIntoConstraints = false
        executionLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        executionLabel.text = "Execution method"
        executionLabel.textAlignment = .center
        
        //ExecutionTextView
        executionTextView.translatesAutoresizingMaskIntoConstraints = false
        executionTextView.isScrollEnabled = false
        executionTextView.text = "Technique desired: "
        executionTextView.backgroundColor = UIColor(red: 235, green: 235, blue: 235, alpha: 0.9)
        executionTextView.layer.cornerRadius = 8
        
        //Devider
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = .lightGray
    }
    
    func layout() {
        addSubview(stackView)
        stackView.addArrangedSubview(exerciseNameLabel)
        stackView.addArrangedSubview(exerciseTextField)
        stackView.addArrangedSubview(repetitionsLabel)
        stackView.addArrangedSubview(repetitionsTextField)
        stackView.addArrangedSubview(executionLabel)
        stackView.addArrangedSubview(executionTextView)
        

        NSLayoutConstraint.activate([
            //StackView
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            bottomAnchor.constraint(equalTo: stackView.bottomAnchor)
        ])
        
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}
