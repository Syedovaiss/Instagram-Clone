//
//  MessageDataMapper.swift
//  Instagram
//
//  Created by apple on 11/05/2023.
//

import Foundation

protocol MessageDataMapperProtocol {
    func toMessagingModel(data:[MessagingResponse]) -> [MessagingModel]
}

class MessageDataMapper:MessageDataMapperProtocol {
    static let shared = MessageDataMapper()
    
    func toMessagingModel(data: [MessagingResponse]) -> [MessagingModel] {
       return data.map { messagingResponse in
            MessagingModel(
                username: messagingResponse.name.orDefault(),
                body: messagingResponse.body.orDefault()
            )
        }
    }
}
