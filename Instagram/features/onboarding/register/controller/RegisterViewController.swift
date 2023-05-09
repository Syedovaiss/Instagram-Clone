//
//  RegisterViewController.swift
//  Instagram
//
//  Created by ovais on 08/05/2023.
//

import UIKit
import SafariServices

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var fullnameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var onTermsAndConditions: UITextView!
    @IBOutlet weak var signingButton: UIButton!
    @IBOutlet weak var backArrow: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        signingButton.isEnabled = false
        signingButton.layer.cornerRadius = 8.0
        passwordTextField.isSecureTextEntry = true
        setupFieldListeners()
        setupBackArrowListener()
        setupTermsAndConditionsListener()
    }
    
    private func setupFieldListeners() {
        emailTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        fullnameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        usernameTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: .editingChanged)
    }
    
    private func setupBackArrowListener() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        backArrow.isUserInteractionEnabled = true
        backArrow.addGestureRecognizer(tapGestureRecognizer)
    }
    
    private func setupTermsAndConditionsListener() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(termsAndConditionsClicked(tapGestureRecognizer:)))
        onTermsAndConditions.isUserInteractionEnabled = true
        onTermsAndConditions.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @IBAction func onSigningUp(_ sender: UIButton) {
        
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        signingButton.isEnabled = getButtonState()
    }
    
    @objc func termsAndConditionsClicked(tapGestureRecognizer: UITapGestureRecognizer)
    {
        guard let url = URL(string: "https://help.instagram.com/581066165581870") else {return }
        let webController = SFSafariViewController(url: url)
        present(webController,animated:true)
        
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        self.dismiss(animated: true)
    }
    
    private func getButtonState() -> Bool {
        return passwordTextField.text?.isEmpty == false &&
        usernameTextField.text?.isEmpty == false &&
        fullnameTextField.text?.isEmpty == false &&
        emailTextField.text?.isEmpty == false
    }
}
