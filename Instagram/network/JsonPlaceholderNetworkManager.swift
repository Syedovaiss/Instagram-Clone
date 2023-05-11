//
//  JsonPlaceholderNetworkManager.swift
//  Instagram
//
//  Created by ovais on 11/05/2023.
//

import Foundation


class JsonPlaceholderNetworkManager {
    
    static let shared = JsonPlaceholderNetworkManager()
    private let urlSession = URLSession(configuration: .default)
    
    func performRequest(endPoint:String,completion:@escaping (Data?,Error?) -> Void) {
        if let url = URL(string: "\(getBaseUrl())\(endPoint)") {
            let task =  urlSession.dataTask(with: url) { (data,urlResponse,errorResponse) in
                if let error = errorResponse {
                    print(error)
                    completion(nil,error)
                    return
                }
                if let safeData = data {
                    if let dataString = String(data: safeData, encoding: .utf8) {
                        completion(data,nil)
                        print(dataString)
                        return
                    }
                    
                }
            }
            task.resume()
        }
    }
    
    private func getBaseUrl() -> String {
        return JSON_PLACEHOLDER_BASE_URL
    }
}
