//
//  GetMessagesUseCase.swift
//  Instagram
//
//  Created by ovais on 11/05/2023.
//

import Foundation

protocol GetMessagesUseCaseProtocol {
    
    func fetchMessages(completion: @escaping (String?,[MessagingModel]?) -> Void)
}

class GetMessagesUseCase : GetMessagesUseCaseProtocol {
    
    private let networkManager = JsonPlaceholderNetworkManager.shared
    private let messageDataMapper = MessageDataMapper.shared
    
    func fetchMessages(completion: @escaping (String?,[MessagingModel]?) -> Void) {
        
        networkManager.performRequest(endPoint: "comments") { data,error in
            if error != nil {
                completion(error?.localizedDescription, nil)
            }
            if let response = data {
                let decoder = JSONDecoder()
                do {
                    let decoded = try decoder.decode([MessagingResponse].self,from: response)
                    let messages = self.messageDataMapper.toMessagingModel(data: decoded)
                    completion(nil,messages)
                } catch {
                    completion(error.localizedDescription,nil)
                }
            }
        }
    }
}
