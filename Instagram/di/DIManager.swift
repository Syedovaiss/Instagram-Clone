//
//  DIManager.swift
//  Instagram
//
//  Created by apple on 11/05/2023.
//

import Foundation


protocol DIManagerProtocol {
    func buildJsonPlaceHolderNetworkManager() -> JsonPlaceholderNetworkManager
    func buildGetMessagesUseCase() -> GetMessagesUseCaseProtocol
    func buildMessagingViewModel() -> MessagingViewModelProtocol
    
}

class DIManager : DIManagerProtocol {
    
    static let shared = DIManager()
    var jsonPlaceholderNetworkManager:JsonPlaceholderNetworkManager?
    var getMessagesUseCase:GetMessagesUseCaseProtocol?
    var messagingViewModel:MessagingViewModelProtocol?
    
    func initDependencies() {
        buildJsonPlaceHolderNetworkManager()
        buildGetMessagesUseCase()
        buildMessagingViewModel()
    }
    
    func buildJsonPlaceHolderNetworkManager() -> JsonPlaceholderNetworkManager {
        if let networkManager = jsonPlaceholderNetworkManager {
            return networkManager
        } else {
            return JsonPlaceholderNetworkManager.shared
        }
    }
    
    func buildGetMessagesUseCase() -> GetMessagesUseCaseProtocol {
        if let messagesUseCase = getMessagesUseCase {
            return messagesUseCase
        } else {
          return GetMessagesUseCase()
        }
    }
    
    func buildMessagingViewModel() -> MessagingViewModelProtocol {
        if let viewModel = messagingViewModel {
            return viewModel
        } else {
            return MessagingViewModel()
        }
    }
    
}
