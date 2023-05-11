//
//  MessagingViewModel.swift
//  Instagram
//
//  Created by ovais on 11/05/2023.
//

import Foundation

protocol MessagingViewModelProtocol {
    func fetchMessages(messages:@escaping ([MessagingModel]) -> Void)
    
}
class MessagingViewModel : MessagingViewModelProtocol {
    
    private let messagingUseCase = GetMessagesUseCase()

    
    func fetchMessages(messages: @escaping ([MessagingModel]) -> Void) {
        messagingUseCase.fetchMessages { errorResponse, messagesList in
            if messagesList != nil {
                messages(messagesList!)
            }
            if let errorMessage = errorResponse {
                print(errorMessage)
            }
        }
    }
    
}
