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
    
    // MARK: - Timer attributes
    
    var timer: Timer?
    var startTime: Date?
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 40)
        label.textAlignment = .center
        return label
    }()
    
    let startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        return button
    }()
    
    let stopButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Stop", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Reset", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(resetTimer), for: .touchUpInside)
        button.isEnabled = false
        return button
    }()
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Exercise"
        navigationController?.navigationBar.prefersLargeTitles = false
        view.backgroundColor = .systemBackground

        style()
        layout()
        setupUI()
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
// Timer
extension ExerciseInfoViewController {


    
    func setupUI() {
        view.addSubview(timeLabel)
        view.addSubview(startButton)
        view.addSubview(stopButton)
        view.addSubview(resetButton)
        
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        startButton.translatesAutoresizingMaskIntoConstraints = false
        stopButton.translatesAutoresizingMaskIntoConstraints = false
        resetButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            timeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startButton.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 30),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: startButton.bottomAnchor, constant: 10),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 10),
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func startTimer() {
        startTime = Date()
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateTimeLabel), userInfo: nil, repeats: true)
        
        startButton.isEnabled = false
        stopButton.isEnabled = true
        resetButton.isEnabled = false
    }
    
    @objc func stopTimer() {
        timer?.invalidate()
        
        startButton.isEnabled = true
        stopButton.isEnabled = false
        resetButton.isEnabled = true
    }
    
    @objc func resetTimer() {
        timer?.invalidate()
        startTime = nil
        timeLabel.text = "00:00:00"
        
        startButton.isEnabled = true
        stopButton.isEnabled = false
        resetButton.isEnabled = false
    }
    
    @objc func updateTimeLabel() {
        guard let startTime = startTime else { return }
        
        let currentTime = Date().timeIntervalSince(startTime)
        let minutes = Int(currentTime / 60)
        let seconds = Int(currentTime.truncatingRemainder(dividingBy: 60))
        let milliseconds = Int((currentTime * 100).truncatingRemainder(dividingBy: 100))
        
        let timeText = String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)
        timeLabel.text = timeText
    }
}

