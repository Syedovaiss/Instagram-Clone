//
//  ViewController.swift
//  Instagram
//
//  Created by apple on 08/05/2023.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    private let authManager = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        handleAuthentication()
    }
    
    private func handleAuthentication() {
        if !authManager.isLoggedIn() {
            navigateToLoginViewController()
        }
    }
    
    private func navigateToLoginViewController() {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Login", bundle: nil)
        let loginViewController = storyBoard.instantiateViewController(withIdentifier: "loginStoryboard") as! LoginViewController
        loginViewController.modalPresentationStyle = .fullScreen
        self.present(loginViewController, animated: true, completion: nil)
    }

}

