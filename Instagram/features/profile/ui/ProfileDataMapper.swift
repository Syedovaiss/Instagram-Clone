//
//  ProfileDataMapper.swift
//  Instagram
//
//  Created by apple on 10/05/2023.
//

import Foundation

protocol ProfileDataMapperProtocol {
    
    func mapUserCount(response:UserCountResponse) -> UserCounts
}

class ProfileDataMapper : ProfileDataMapperProtocol {
    
    static let mapper = ProfileDataMapper()
    
    func mapUserCount(response: UserCountResponse) -> UserCounts {
        return UserCounts(postCount: response.totalHits, followersCount: response.total, followingCount: response.totalHits/2)
    }
    
}
