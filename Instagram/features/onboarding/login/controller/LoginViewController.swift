//
//  LoginViewController.swift
//  Instagram
//
//  Created by apple on 08/05/2023.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var identityTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.isEnabled = false
        passwordTextField.isSecureTextEntry = true
    }

    @IBAction func onUsernameChanged(_ sender: UITextField) {
        
    }
    
    @IBAction func onPasswordChanged(_ sender: UITextField) {
        if identityTextField.text?.isEmpty == false && sender.text?.isEmpty == false {
            loginButton.isEnabled = true
        }
    }
    
    @IBAction func onSignUp(_ sender: UIButton) {
        
    }
    @IBAction func onLogin(_ sender: UIButton) {
        
        if identityTextField.text?.isEmpty == true {
            showToast(controller: self, message: "Username is Empty", seconds: 2.0)
        } else if passwordTextField.text?.isEmpty == true {
            showToast(controller: self, message: "Password is Empty", seconds: 2.0)
        } else {
            showToast(controller: self, message: "Logging In", seconds: 2.0)
        }
 
    }
    func showToast(controller: UIViewController, message : String, seconds: Double) {
        let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        alert.view.backgroundColor = UIColor.black
        alert.view.alpha = 0.6
        alert.view.layer.cornerRadius = 15
        controller.present(alert, animated: true)

        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + seconds) {
            alert.dismiss(animated: true)
        }
    }
}
