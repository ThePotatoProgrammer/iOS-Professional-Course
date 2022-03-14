//
//  ViewController.swift
//  BankApp
//
//  Created by Joshua Baker on 3/13/22.
//

import UIKit

class LoginViewController: UIViewController {

    var uiComponents: [UIView] = []
    
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        addStyleToUIComponents()
        addLayoutConstraintsToUIComponents()
    }
    
    // MARK: Computed Properties
    var username: String? {
        return loginView.usernameTextField.text
    }
    
    var password: String? {
        return loginView.passwordTextField.text
    }
}

extension LoginViewController {
    private func addStyleToUIComponents() {
        
        uiComponents.append(loginView)
        uiComponents.append(signInButton)
        uiComponents.append(errorMessageLabel)

        for uiView in uiComponents {
            uiView.translatesAutoresizingMaskIntoConstraints = false
        }

        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8 // for indicator spacing
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Incorrect username or password"
        errorMessageLabel.isHidden = true
        
    }
    
    private func addLayoutConstraintsToUIComponents() {
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        
        // loginView
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
            ])
        
        // signInButton
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        // errorMessageLabel
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}

// MARK: Actions
extension LoginViewController {
    @objc func signInTapped(sender: UIButton) {
        login()
    }
    
    fileprivate func login() {
        
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            updateErrorMessageLabel(withMessage: "Username / Password can't be blank")
            return
        }
        
        if (username == "JOSH" && password == "BANANA") {
            signInButton.configuration?.showsActivityIndicator = true
            errorMessageLabel.isHidden = true
        } else {
            updateErrorMessageLabel(withMessage: "Incorrect Username / Password")
        }
    }
    
    fileprivate func updateErrorMessageLabel(withMessage message: String) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
