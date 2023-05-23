//
//  RegisterViewController.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 22/05/23.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: - Attributes
    let welcomeLabel = UILabel()
    let registerView = RegisterView()
    let registerButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    var email: String? {
        return registerView.emailTextField.text
    }
    var username: String? {
        return registerView.usernameTextfield.text
    }
    var password: String? {
        return registerView.passwordTextfield.text
    }
    var confirmPassword: String? {
        return registerView.confirmPasswordTextfield.text
    }
    
    
    // MARK: - View life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.title = "Register"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        style()
        layout()
    }
}

    // MARK: - Methods
extension RegisterViewController {
    func style() {
        registerView.translatesAutoresizingMaskIntoConstraints = false
        
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.configuration = .filled()
        registerButton.configuration?.imagePadding = 8
        registerButton.setTitle("Register", for: .normal)
        registerButton.backgroundColor = .systemBlue
        registerButton.layer.cornerRadius = 8
        registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .primaryActionTriggered)
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.numberOfLines = 0
        welcomeLabel.font = .systemFont(ofSize: 21, weight: .regular)
        welcomeLabel.text = "Thank you for choosing Workount! Please enter your details to get started."
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.isHidden = true
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
    }
    
    func layout() {
        self.view.addSubview(welcomeLabel)
        self.view.addSubview(registerView)
        self.view.addSubview(registerButton)
        self.view.addSubview(errorMessageLabel)
        
        
        NSLayoutConstraint.activate([
            
            
            //WelcomeLabel
            welcomeLabel.bottomAnchor.constraint(equalTo: self.registerView.topAnchor, constant: -20),
            welcomeLabel.leadingAnchor.constraint(equalTo: self.registerView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: self.registerView.trailingAnchor, constant: -20),

            //RegisterView
            registerView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            registerView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            registerView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            registerView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            //RegisterButton
            registerButton.topAnchor.constraint(equalTo: self.registerView.bottomAnchor, constant: 20),
            registerButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            registerButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            registerButton.heightAnchor.constraint(equalToConstant: 35),
            
            //ErrorMessageLabel
            errorMessageLabel.topAnchor.constraint(equalTo: self.registerButton.bottomAnchor, constant: 20),
            errorMessageLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            errorMessageLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        
        ])
    }
    
    @objc func registerButtonTapped() {
        //test
        print("Button was tapped")
        // to do
        guard let email = self.email, let username = self.username, let password = self.password, let confirmPassword = self.password else {
            assertionFailure("Theses textFields can not be nil")
            return
        }
        if email.isEmpty || username.isEmpty || password.isEmpty || confirmPassword.isEmpty {
            errorEmptyTextField(withMessage: "You should complete all the information above")
        } else if username == "Rodrigo" {
            errorUserAlreadyExists(withMessage: "Email / User already exists")
        } else if password != confirmPassword{
            errorPassword(withMessage: "Your password do not match")
        }else {
            registerIsApproved(title: "Welcome", message: "We're all set! Enjoy your journey with Workount.")
        }
        
        
        
        //creste a new account -> Success
        
        
        
        

    }
    
    func errorEmptyTextField(withMessage message: String) {
        self.errorMessageLabel.isHidden = false
        self.errorMessageLabel.text = message
    }
    
    func errorUserAlreadyExists(withMessage message: String) {
        self.errorMessageLabel.isHidden = false
        self.errorMessageLabel.text = message

    }

    func errorPassword(withMessage message: String) {
        self.errorMessageLabel.isHidden = false
        self.errorMessageLabel.text = message
    }
    
    func registerIsApproved(title: String, message: String) {
        self.registerButton.configuration?.showsActivityIndicator = true
        // alert
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { login in
            self.navigationController?.popViewController(animated: true)
        }))
        present(alert, animated: true)
    }
    
}

