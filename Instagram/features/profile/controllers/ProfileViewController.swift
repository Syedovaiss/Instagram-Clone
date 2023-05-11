//
//  ProfileViewController.swift
//  Instagram
//
//  Created by ovais on 08/05/2023.
//

import UIKit
import LZViewPager
import JGProgressHUD

class ProfileViewController: UIViewController,LZViewPagerDelegate,LZViewPagerDataSource {
    
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var bioContent: UITextView!
    @IBOutlet weak var fullname: UITextView!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followersCount: UILabel!
    @IBOutlet weak var postCount: UILabel!
    @IBOutlet weak var menuButton: UIImageView!
    @IBOutlet weak var username: UITextView!
    @IBOutlet weak var lzViewPager: LZViewPager!
    private var subControllers:[UIViewController] = []
    private let storage = LocalStorageManager.shared
    private let dataManager = ProfileDataManager.shared
    private var hud = JGProgressHUD()
    
    func numberOfItems() -> Int {
        return self.subControllers.count
    }
    
    func controller(at index: Int) -> UIViewController {
        return subControllers[index]
    }
    
    func button(at index: Int) -> UIButton {
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        return button
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        showProgressBar()
        setupUserData()
        setupMenuListener()
        lzViewPager.delegate = self
        lzViewPager.dataSource = self
        lzViewPager.hostController = self
        subControllers = [getAllPostViewController(),getTaggedPostViewController()]
        lzViewPager.reload()
    }
    
    private func setupUserData() {
        fullname.text = getFullname()
        username.text = storage.getUsername()
        
        // MARK: - Hitting pixabay api and set some counts from it to post, followers and following
        
        initUserInfo()
    }
    private func getFullname() -> String {
        if storage.getFullname().isEmpty {
            return "\(storage.getUsername()) User"
        } else {
            return storage.getFullname()
        }
    }
    
    private func getAllPostViewController() -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "allpoststoryboard") as! AllPostViewController
        viewController.title = "Your Post"
        return viewController
    }
    
    private func getTaggedPostViewController() -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "taggedpoststoryboard") as! TaggedPostViewController
        viewController.title = "Tagged Post"
        return viewController
    }
    
    func colorForIndicator(at index: Int) -> UIColor {
        return .black
    }
    
    private func setupMenuListener() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onMenuTapped(tapGestureRecognizer:)))
        menuButton.isUserInteractionEnabled = true
        menuButton.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc func onMenuTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        let storyBoard = UIStoryboard(name: "Settings", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "settingsStoryBoard") as! SettingsViewController
        self.present(viewController, animated: true)
    }
    
    private func initUserInfo() {
        dataManager.getUserCounts { userData in
            if let data = userData {
                DispatchQueue.main.async {
                    self.postCount.text = data.postCount.toString()
                    self.followersCount.text = data.followersCount.toString()
                    self.followingCount.text = data.followingCount.toString()
                    self.hideProgressBar()
                }
            } else { self.hideProgressBar() }
        }
    }
    private func showProgressBar() {
        hud.show(in: self.view)
    }
    
    private func hideProgressBar() {
        hud.dismiss()
    }
}
