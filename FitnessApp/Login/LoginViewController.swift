//
//  ViewController.swift
//  FitnessApp
//
//  Created by Rodrigo Colozio on 20/05/23.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    // MARK: - Attributes
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    let loginView = LoginView()
    let loginButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    var username: String? {
        return loginView.usernameTextField.text
    }
    var password: String? {
        return loginView.passwordTextField.text
    }
    let createAccount = UIButton ()
    
    // MARK: - View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        style()
        layout()
        checkIfUsersIsSignedIn()
    }
}


    // MARK: - Style and layout
extension LoginViewController {
    func style() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Workount"
        titleLabel.textAlignment = .center
        titleLabel.font = .systemFont(ofSize: 35, weight: .semibold)
        
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.text = "Welcome to your personal fitness tracker. The best way to keep your work out on track"
        descriptionLabel.font = .systemFont(ofSize: 18, weight: .regular)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .center
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
        loginButton.configuration?.imagePadding = 8
        loginButton.setTitle("Log In", for: .normal)
        loginButton.backgroundColor = .systemBlue
        loginButton.layer.cornerRadius = 8
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.isHidden = true
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.numberOfLines = 0
        
        createAccount.translatesAutoresizingMaskIntoConstraints = false
        createAccount.configuration = .plain()
        createAccount.setTitle("Don't have an account? Create one", for: .normal)
        createAccount.addTarget(self, action: #selector(createButtonTapped), for: .primaryActionTriggered)

    }
    
    func layout() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(loginView)
        view.addSubview(loginButton)
        view.addSubview(errorMessageLabel)
        view.addSubview(createAccount)
        
        
        NSLayoutConstraint.activate([
            //TitleLabel
            titleLabel.bottomAnchor.constraint(equalTo: self.descriptionLabel.topAnchor, constant: -25),
            titleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            
            //DescriptionLabel
            descriptionLabel.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -20),
            descriptionLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            //Login View
            loginView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            loginView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            //LoginButton
            loginButton.topAnchor.constraint(equalTo: self.loginView.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 40),
            loginButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -40),
            loginButton.heightAnchor.constraint(equalToConstant: 35),
            
            //ErrorMessageLabel
            errorMessageLabel.topAnchor.constraint(equalTo: self.loginButton.bottomAnchor, constant: 30),
            errorMessageLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            errorMessageLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            
            //CreateAccount
            createAccount.topAnchor.constraint(equalTo: self.errorMessageLabel.bottomAnchor, constant: 20),
            createAccount.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            createAccount.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30),


        ])
    }
}


    // MARK: -  Methods
extension LoginViewController {
    
    @objc func loginButtonTapped(){
        guard let username = self.username, let password = self.password else {
            assertionFailure("Those field could never be nil")
            return
        }
//        
//        if username.isEmpty || password.isEmpty {
//            configureErroeMesage(withMessage: "Email / Password can not be empty")
//        } else if username != "Rodrigo" && password != "Welcome"{
//            configureErroeMesage(withMessage: "Email or password is wrong, please try again ...")
//        } else {
//            configureLoginSuccess()
//            userIsLoggedIn()
//        }
        
        // get auth instance
        // attempt sign in
        // if failure, present errorMessage
        
        FirebaseAuth.Auth.auth().signIn(withEmail: username, password: password, completion: { [weak self] result, error in
            guard let strongSelf = self else { return }
            guard error == nil else {
                if username.isEmpty || password.isEmpty {
                    strongSelf.configureErroeMesage(withMessage: "Email / Password can not be empty or user is already in use")
                }
                print("user failed when logging in")
                return
            }
            //Success state
            strongSelf.configureLoginSuccess()
            strongSelf.userIsLoggedIn()
            strongSelf.loginView.usernameTextField.resignFirstResponder()
            strongSelf.loginView.passwordTextField.resignFirstResponder()
        })
    }
    
    
    
    func configureLoginSuccess() {
        loginButton.configuration?.showsActivityIndicator = true
    }
    
    func userIsLoggedIn() {
        if loginButton.configuration?.showsActivityIndicator == true {
            // Set a delay of 1 second before presenting the other view controller
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                // Instantiate and present the other view controller
                let homeVC = HomeViewController()
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
        }
    }
    
    
    func configureErroeMesage(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
    @objc func createButtonTapped() {
        print("Create button was tapped")
        let registerVC = RegisterViewController()
        self.navigationController?.pushViewController(registerVC, animated: true)
        
    }
    
    func checkIfUsersIsSignedIn() {
        if FirebaseAuth.Auth.auth().currentUser != nil {
            let homeVC = HomeViewController()
            self.navigationController?.pushViewController(homeVC, animated: true)
        }
    }
    
}

