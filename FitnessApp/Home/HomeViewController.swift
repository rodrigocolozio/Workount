//
//  HomeViewController.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 21/05/23.
//

import UIKit

class HomeViewController: UIViewController {

    
    // MARK: - Attributes
    let scrollView = UIScrollView()
    let contentView = UIView()
    let topView = UIView()
    let tableView = UITableView()
    let midView = UIView()
    let addExercise = ExerciseView()
    let addExerciseButton = UIButton(type: .system)
    
    
    
    
    var exercises: [Exercise] = [Exercise(exerciseName: "Posterior de coxas", repetitions: "4x15", execution: "Concentrado com progressão de carga Concentrado com progressão de cargaConcentrado com progressão de cargaConcentrado com progressão de cargaConcentrado com progressão de cargaConcentrado com progressão de cargaConcentrado com progressão de cargaConcentrado com progressão de cargaConcentrado com progressão de carga"), Exercise(exerciseName: "Elevação pélvica", repetitions: "6x10", execution: "Progressão de carga"), Exercise(exerciseName: "Elevação pélvica", repetitions: "6x10", execution: "Progressão de carga")]
    


    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.setHidesBackButton(true, animated: false)
        navigationItem.title = "Exercises"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        style()
        layout()
        addBarButton()
    }
    
    private func configureTableView() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "Cell")
    }

    func style() {
        //ScrollView
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        //ContentView
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        //TopView
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .lightGray
        
        //configure tableView
        configureTableView()
        
        //Midview
        midView.translatesAutoresizingMaskIntoConstraints = false
        midView.backgroundColor = .cyan
        
        //ExerciseInfoView
        addExercise.translatesAutoresizingMaskIntoConstraints = false
        
        //AddExerciseButton
        addExerciseButton.translatesAutoresizingMaskIntoConstraints = false
        addExerciseButton.setTitle("Add Exercise", for: .normal)
        addExerciseButton.backgroundColor = .systemBlue
        addExerciseButton.configuration = .filled()
        addExerciseButton.configuration?.imagePadding = 8
        addExerciseButton.addTarget(self, action: #selector(AddButtonTapped), for: .primaryActionTriggered)
        addExerciseButton.layer.cornerRadius = 8
        
    }
    
    func layout() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(topView)
        contentView.addSubview(tableView)
//        contentView.addSubview(midView)
//        contentView.addSubview(addExercise)
        contentView.addSubview(addExerciseButton)
        
        
        
        
        //Setup contentView
        let hConst = contentView.heightAnchor.constraint(equalTo: self.scrollView.heightAnchor)
        hConst.isActive = true
        hConst.priority = UILayoutPriority(50)
        
        NSLayoutConstraint.activate([
        
            //welcomeLabel
            scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor),
            
            topView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            topView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 350),
            
            tableView.topAnchor.constraint(equalTo: self.topView.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.topView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.topView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: -1),
//
//            midView.topAnchor.constraint(equalTo: topView.bottomAnchor, constant: 0),
//            midView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
//            midView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
//            midView.heightAnchor.constraint(equalToConstant: 300),
//
//            addExercise.topAnchor.constraint(equalTo: self.midView.topAnchor, constant: 10),
//            addExercise.centerXAnchor.constraint(equalTo: self.midView.centerXAnchor),
//            addExercise.leadingAnchor.constraint(equalTo: self.midView.leadingAnchor, constant: 12),
//            addExercise.trailingAnchor.constraint(equalTo: self.midView.trailingAnchor, constant: -12),
            
            addExerciseButton.topAnchor.constraint(equalTo: self.topView.bottomAnchor, constant: 50),
            addExerciseButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            addExerciseButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            addExerciseButton.heightAnchor.constraint(equalToConstant: 35)


        ])
    }
    
    func addBarButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchBarButton))
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exercises.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        let exercise = exercises[indexPath.row]
        
        cell.exerciseTitle.text  = exercise.exerciseName
        cell.repetitionLabel.text = exercise.repetitions
        cell.executionLabel.text = exercise.execution
        
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        if selectedCell == indexPath {
//            return
//        }
//        return 60
//    }
//
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedRow = tableView.cellForRow(at: indexPath) else { return }
                    
        let infoVc = ExerciseInfoViewController()
        self.navigationController?.pushViewController(infoVc, animated: true)
        
        }


     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Remove the item from your data source array
            exercises.remove(at: indexPath.row)

            // Delete the row from the table view
            tableView.deleteRows(at: [indexPath], with: .bottom)
        }

    }
    
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true // Enable editing for all cells
    }
}

    // MARK: - Actions
extension HomeViewController {
    @objc func AddButtonTapped() {
        let addVC = AddExerciseViewController()
        addVC.modalPresentationStyle = .formSheet
        addVC.modalTransitionStyle = .flipHorizontal
        addVC.delegate = self
        present(addVC, animated: true)
    }
    
    
    @objc func searchBarButton() {
        print("searchButton")
    }
}

// MARK: - AddDelegate
extension HomeViewController: AddExerciseDelegate {
    func add(exercise: Exercise) {
        exercises.append(exercise)
        tableView.reloadData()
    }
    
    
}

