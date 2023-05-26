//
//  RegisterView.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 22/05/23.
//

import Foundation
import UIKit

class RegisterView: UIView {
    
    // MARK: - Attributes
    let stackView = UIStackView()
    let emailTextField = UITextField()
    let usernameTextfield = UITextField()
    let passwordTextfield = UITextField()
    let confirmPasswordTextfield = UITextField()
    let divider1 = UIView()
    let divider2 = UIView()
    let divider3 = UIView()


    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

// MARK: - Style and layout
extension RegisterView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        clipsToBounds = true
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.placeholder = "Email"
        emailTextField.layer.cornerRadius = 8
        emailTextField.autocapitalizationType = .none
        emailTextField.delegate = self
        
        usernameTextfield.translatesAutoresizingMaskIntoConstraints = false
        usernameTextfield.placeholder = "Username"
        usernameTextfield.layer.cornerRadius = 8
        usernameTextfield.delegate = self
        
        passwordTextfield.translatesAutoresizingMaskIntoConstraints = false
        passwordTextfield.placeholder = "Password"
        passwordTextfield.layer.cornerRadius = 8
        passwordTextfield.autocapitalizationType = .none
        passwordTextfield.delegate = self
        
        confirmPasswordTextfield.translatesAutoresizingMaskIntoConstraints = false
        confirmPasswordTextfield.placeholder = "Confirm password"
        confirmPasswordTextfield.layer.cornerRadius = 8
        confirmPasswordTextfield.delegate = self
        
        divider1.translatesAutoresizingMaskIntoConstraints = false
        divider1.backgroundColor = .lightGray
        
        divider2.translatesAutoresizingMaskIntoConstraints = false
        divider2.backgroundColor = .lightGray
        
        divider3.translatesAutoresizingMaskIntoConstraints = false
        divider3.backgroundColor = .lightGray

        
    }
    
    
    func layout() {
        addSubview(stackView)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(divider1)
        stackView.addArrangedSubview(usernameTextfield)
        stackView.addArrangedSubview(divider2)
        stackView.addArrangedSubview(passwordTextfield)
        stackView.addArrangedSubview(divider3)
        stackView.addArrangedSubview(confirmPasswordTextfield)
        
        
        NSLayoutConstraint.activate([
            
            //StackView
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1),
            
            divider1.heightAnchor.constraint(equalToConstant: 1),
            divider2.heightAnchor.constraint(equalToConstant: 1),
            divider3.heightAnchor.constraint(equalToConstant: 1),

        
        ])
        
    }
    
}

extension RegisterView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.endEditing(true)
        usernameTextfield.endEditing(true)
        passwordTextfield.endEditing(true)
        confirmPasswordTextfield.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
}
