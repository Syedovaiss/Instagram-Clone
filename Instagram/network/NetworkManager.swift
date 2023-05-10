//
//  NetworkManager.swift
//  Instagram
//
//  Created by ovais on 10/05/2023.
//

import Foundation

class NetworkManager  {
    
    static let shared = NetworkManager()
    private let urlSession = URLSession(configuration: .default)
    
    /// Perform network request and returns Data if their is no error occured with error = nil else it will return eror if something unexpected happen with nil data
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
        return "\(BASE_URL)?key=\(API_KEY)"
    }
    
}
