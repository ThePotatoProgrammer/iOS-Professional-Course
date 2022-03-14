//
//  LoginView.swift
//  BankApp
//
//  Created by Joshua Baker on 3/13/22.
//

import Foundation
import UIKit

class LoginView: UIView {
    
    var uiComponents: [UIView] = []
    
    let stackView = UIStackView()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let dividerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addStyleToUIComponents()
        addLayoutConstraintsToUIComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension LoginView {
    func addStyleToUIComponents() {
        
        uiComponents.append(self)
        uiComponents.append(stackView)
        uiComponents.append(usernameTextField)
        uiComponents.append(passwordTextField)
        uiComponents.append(dividerView)
        
        for uiView in uiComponents {
            uiView.translatesAutoresizingMaskIntoConstraints = false
        }
        
        backgroundColor = .secondarySystemBackground
        
        stackView.axis = .vertical
        stackView.spacing = 8
        
        usernameTextField.placeholder = "Username"
        usernameTextField.delegate = self
        
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        passwordTextField.delegate = self
        
        dividerView.backgroundColor = .secondarySystemFill
        
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    func addLayoutConstraintsToUIComponents() {
        stackView.addArrangedSubview(usernameTextField)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(passwordTextField)
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        dividerView.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }
}

// MARK: - UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }
}
