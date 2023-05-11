//
//  SettingsViewController.swift
//  Instagram
//
//  Created by ovais on 08/05/2023.
//

import UIKit

class SettingsViewController: UIViewController {

    private let storage = LocalStorageManager.shared
    private let authManager = AuthManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onLogout(_ sender: UIButton) {
        authManager.logout()
        storage.clear()
        self.navigationController?.popToRootViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
