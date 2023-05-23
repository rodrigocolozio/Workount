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
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Exercise"
        view.backgroundColor = .systemBackground

    }
    
}
