//
//  CustomTableViewCell.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 22/05/23.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    var data: Exercise? {
        didSet {
            guard let data = self.data else { return }
            self.exerciseTitle.text = data.exerciseName
            self.repetitionLabel.text = data.repetitions
            self.executionLabel.text = data.execution
        }
    }
    
    var exerciseTitle = UILabel()
    var executionLabel = UILabel()
    var repetitionLabel = UILabel()
    let container = UIView()

    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setup()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension CustomTableViewCell {
    func setup() {
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 0.8)
        container.layer.cornerRadius = 8
        
        exerciseTitle.translatesAutoresizingMaskIntoConstraints = false
        exerciseTitle.font = .systemFont(ofSize: 20, weight: .bold)
        exerciseTitle.text = "Exercise"
        exerciseTitle.textAlignment = .center
        
        repetitionLabel.translatesAutoresizingMaskIntoConstraints = false
        repetitionLabel.font = .systemFont(ofSize: 19, weight: .semibold)
        repetitionLabel.text = "4x12"
        repetitionLabel.textAlignment = .center
        
        executionLabel.translatesAutoresizingMaskIntoConstraints = false
        executionLabel.font = .systemFont(ofSize: 17, weight: .regular)
        executionLabel.text = "Here goes the exercise's execution"
        executionLabel.numberOfLines = 2
        
    }
    
    func layout() {
        contentView.addSubview(container)
        container.addSubview(exerciseTitle)
        container.addSubview(repetitionLabel)
        container.addSubview(executionLabel)
        
        
        NSLayoutConstraint.activate([
        
            //Container into contentView
            container.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            container.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            container.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            exerciseTitle.topAnchor.constraint(equalTo: self.container.topAnchor, constant: 5),
            exerciseTitle.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 40),
            exerciseTitle.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -40),

            repetitionLabel.topAnchor.constraint(equalTo: self.exerciseTitle.bottomAnchor, constant: 5),
            repetitionLabel.leadingAnchor.constraint(equalTo: self.container.leadingAnchor, constant: 10),
            repetitionLabel.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -10),
            repetitionLabel.widthAnchor.constraint(equalToConstant: 50),
            
            executionLabel.topAnchor.constraint(equalTo: self.exerciseTitle.bottomAnchor, constant: 5),
            executionLabel.leadingAnchor.constraint(equalTo: self.repetitionLabel.trailingAnchor, constant: 15),
            executionLabel.trailingAnchor.constraint(equalTo: self.container.trailingAnchor, constant: -15),
            executionLabel.bottomAnchor.constraint(equalTo: self.container.bottomAnchor, constant: -10)
            
            

        
        ])
        
        
        
    }
    
    
}
