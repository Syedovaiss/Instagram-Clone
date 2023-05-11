//
//  MessageListingViewController.swift
//  Instagram
//
//  Created by ovais on 08/05/2023.
//

import UIKit

class MessageListingViewController: UIViewController {

    private let messageViewModel = MessagingViewModel()
    private var messages = [MessagingModel]()
    
    @IBOutlet weak var messageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageViewModel.fetchMessages { data in
            self.messages = data
            DispatchQueue.main.sync {
                self.messageTableView.delegate = self
                self.messageTableView.dataSource = self
                self.messageTableView.reloadData()
            }
        }
    }
}

extension MessageListingViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell") as! MessageListingTableViewCell
        let message = messages[indexPath.row]
        cell.username.text = message.username
        cell.messageBody.text = message.body
        return cell
    }
}

extension MessageListingViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        routeToChatViewController(data: messages[indexPath.row])
    }
    
    private func routeToChatViewController(data:MessagingModel) {
        let storyBoard = UIStoryboard(name: "MessageListing", bundle: nil)
        let chatViewController = storyBoard.instantiateViewController(identifier: "chatStoryboard") as! ChatViewController
        chatViewController.messageDetails = data
        self.present(chatViewController,animated: true)
    }
}
