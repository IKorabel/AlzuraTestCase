//
//  ViewController.swift
//  AlzuraTestCase
//
//  Created by Игорь Корабельников on 17.08.2022.
//

import UIKit
import SkyFloatingLabelTextField

class AuthenticationVC: UIViewController {
    
    //MARK: Outlets
    private lazy var signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.makeASStyleCircularButton(title: "Sign in", cornerRadius: 20, backgroundColor: .systemBlue, titleColor: .white)
        signInButton.addTarget(self, action: #selector(didClickedOnSignInButton(_:)), for: .touchUpInside)
        return signInButton
    }()
    
    private lazy var signUpButton: UIButton = {
        let signUpButton = UIButton()
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        signUpButton.makeASStyleCircularButton(title: "Sign Up", cornerRadius: 20, backgroundColor: .systemGreen, titleColor: .white)
        signUpButton.addTarget(self, action: #selector(didClickedOnSignUpButton(_:)), for: .touchUpInside)
        return signUpButton
    }()
    
    private lazy var authenticationButtons: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [signInButton, signUpButton])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var loginTextField: SkyFloatingLabelTextFieldWithIcon = {
        let loginTextField = SkyFloatingLabelTextFieldWithIcon(frame: CGRect(x: 0, y: 0, width: 120, height: 50), iconType: .image)
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.placeholder = "Your Email"
        loginTextField.selectedLineColor = .systemBlue
        loginTextField.selectedTitleColor = .systemBlue
        loginTextField.lineHeight = 1.0 // bottom line height in points
        loginTextField.selectedLineHeight = 2.0
        loginTextField.iconImage = UIImage(systemName: "at")
        loginTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return loginTextField
    }()
    
    private lazy var passwordTextField: SkyFloatingLabelTextFieldWithIcon = {
        let passwordTextField = SkyFloatingLabelTextFieldWithIcon(frame: CGRect(x: 0, y: 0, width: 120, height: 50), iconType: .image)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Your password"
        passwordTextField.selectedLineColor = .systemBlue
        passwordTextField.selectedTitleColor = .systemBlue
        passwordTextField.lineHeight = 1.0 // bottom line height in points
        passwordTextField.selectedLineHeight = 2.0
        passwordTextField.iconImage = UIImage(systemName: "signature")
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return passwordTextField
    }()
    
    private lazy var authTextFieldsStackView: UIStackView = {
      let stackView = UIStackView(arrangedSubviews: [loginTextField, passwordTextField])
      stackView.translatesAutoresizingMaskIntoConstraints = false
      stackView.axis = .vertical
      stackView.spacing = 45
      return stackView
    }()
    
    private lazy var mainAuthorizationStackView: UIStackView = {
        let mainStackView = UIStackView(arrangedSubviews: [authTextFieldsStackView, authenticationButtons])
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.spacing = 30
        mainStackView.axis = .vertical
        return mainStackView
    }()
    
    
    let authManager = AuthenticationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Welcome to Alzura"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        presentMainStackView()
    }
    
    private func presentMainStackView() {
        NSLayoutConstraint.activate([
            signUpButton.heightAnchor.constraint(equalToConstant: 45),
            loginTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
        view.addSubview(mainAuthorizationStackView)
        NSLayoutConstraint.activate([
            mainAuthorizationStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainAuthorizationStackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            mainAuthorizationStackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20)
        ])
    }
    
    //MARK: Actions
    
    @objc private func didClickedOnSignUpButton(_ sender: UIButton) {
        authManager.signUp(user: .init(email: loginTextField.text!,
                                       password: passwordTextField.text!)) { authResult in
            switch authResult {
            case .success(_):
                SegueHelper.toOrders.makeSegue(fromVC: self)
            case .failure(let errorDescription):
                AlertManager.createErrorAlert(vc: self, errorTheme: "Sign up error", errorDescription: errorDescription)
            }
        }
    }
    
    @objc private func didClickedOnSignInButton(_ sender: UIButton) {
        authManager.signIn(user: .init(email: loginTextField.text!, password: passwordTextField.text!)) { signInResult in
            switch signInResult {
            case .success(_):
                SegueHelper.toOrders.makeSegue(fromVC: self)
            case .failure(let errorDescription):
                AlertManager.createErrorAlert(vc: self, errorTheme: "Sign in error", errorDescription: errorDescription)
            }
        }
    }
}

extension AuthenticationVC: UITextFieldDelegate {
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        switch textField {
        case loginTextField:
            loginTextField.errorMessage = !ValidationManager.isValidEmail(text) ? "Invalid email" : nil
        case passwordTextField:
            passwordTextField.errorMessage = !ValidationManager.isPasswordValid(password: text) ? "Minumum 8 symbols" : nil
        default:
            break
        }
//        if loginTextField.text!.isEmpty || passwordTextField.text!.isEmpty {
//            signInButton.isEnabled = false
//            signUpButton.isEnabled = false
//            signUpButton.setBackgroundColor(.systemGreen.withAlphaComponent(0.1), forState: .normal)
//            signInButton.setBackgroundColor(.systemBlue.withAlphaComponent(0.1), forState: .normal)
//        } else {
//            signInButton.isEnabled = true
//            signUpButton.isEnabled = true
//            signUpButton.setBackgroundColor(.systemGreen.withAlphaComponent(1), forState: .normal)
//            signInButton.setBackgroundColor(.systemBlue.withAlphaComponent(1), forState: .normal)
//        }
    }
    
}
