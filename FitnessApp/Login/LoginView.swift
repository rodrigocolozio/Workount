//
//  LoginView.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 20/05/23.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    
    // MARK: - Attributes
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

    // MARK: - Login style and layout
extension LoginView {
    
    func style() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        layer.cornerRadius = 8
        clipsToBounds = true
        
        
        // stackView
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 8
        // email
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Email"
        usernameTextField.autocapitalizationType = .none
        usernameTextField.layer.cornerRadius = 8
        usernameTextField.delegate = self
        
        //password
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.layer.cornerRadius = 8
        passwordTextField.delegate = self
        passwordTextField.isSecureTextEntry = true
        
        //dividerView
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .lightGray
        
    }
    
    
    func layout() {
        addSubview(stackView)
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
    }
}

// MARK: - TextFieldDelegate
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        usernameTextField.endEditing(true)
        passwordTextField.endEditing(true)
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
       return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // to do
    }
}
    

