//
//  ProfileDataManager.swift
//  Instagram
//
//  Created by apple on 10/05/2023.
//

import Foundation


protocol ProfileDataManagerProtocol {
    
    func getUserCounts(count: @escaping (UserCounts?) -> Void)
    
}

class ProfileDataManager :ProfileDataManagerProtocol {
    
    private let dataMapper = ProfileDataMapper.mapper
    private let networkManager = NetworkManager.shared
    private let decoder = JSONDecoder()
    static let shared = ProfileDataManager()
    
    func getUserCounts(count: @escaping (UserCounts?) -> Void) {
        networkManager.performRequest(endPoint: getUserCountsParams()) { response, errorResponse in
            if errorResponse != nil {
                count(nil)
            }
            if let data = response {
                do {
                    let decodedData =  try self.decoder.decode(UserCountResponse.self, from: data)
                    let mappedData = self.dataMapper.mapUserCount(response: decodedData)
                    count(mappedData)
                } catch {
                    print(error)
                }
            }
            
        }
    }
    private func getUserCountsParams() -> String {
        return "&q=man&image_type=photo&pretty=true"
    }
    
}
