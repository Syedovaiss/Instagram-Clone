//
//  LoginViewController.swift
//  Instagram
//
//  Created by ovais on 08/05/2023.
//

import UIKit
import JGProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var identityTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    private var hud = JGProgressHUD()
    private let authManager = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        loginButton.isEnabled = false
        loginButton.layer.cornerRadius = 8.0
        passwordTextField.isSecureTextEntry = true
        identityTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        loginButton.isEnabled = identityTextField.text?.isEmpty == false &&
        passwordTextField.text?.isEmpty == false
    }
    
    
    @IBAction func onSignUp(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Register", bundle: nil)
        let registerViewController = storyboard.instantiateViewController(withIdentifier: "registerStoryboard") as! RegisterViewController
        registerViewController.modalPresentationStyle = .fullScreen
        self.present(registerViewController, animated: false, completion: nil)
    }
    
    @IBAction func onLogin(_ sender: UIButton) {
        if identityTextField.text?.isEmpty == true {
            showUsernameError()
        } else if passwordTextField.text?.isEmpty == true {
            showPasswordError()
        } else {
            showProgressBar()
            authManager.loginUser(username: identityTextField.getTextOrDefault(), password: passwordTextField.getTextOrDefault()) { isLoggedIn in
                self.hideProgressBar()
                LocalStorageManager().setUsername(username: self.identityTextField.getTextOrDefault())
                if isLoggedIn {
                    self.dismiss(animated: true)
                }
            }
        }
    }
    
    private func showUsernameError() {
        let errorFieldBorderColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        identityTextField.layer.borderWidth = 1.0
        identityTextField.layer.cornerRadius = 5.0
        identityTextField.layer.borderColor = errorFieldBorderColor.cgColor
        identityTextField.textColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        
        
    }
    
    
    private func showPasswordError() {
        let errorFieldBorderColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
        passwordTextField.layer.borderWidth = 1.0
        passwordTextField.layer.cornerRadius = 5.0
        passwordTextField.layer.borderColor = errorFieldBorderColor.cgColor
        passwordTextField.textColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1.0)
    }
    
    private func showProgressBar() {
        hud.show(in: self.view)
    }
    
    private func hideProgressBar() {
        hud.dismiss()
    }
}
