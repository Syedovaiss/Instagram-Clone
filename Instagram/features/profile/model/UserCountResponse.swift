//
//  UserCountResponse.swift
//  Instagram
//
//  Created by apple on 10/05/2023.
//

import Foundation

struct UserCountResponse : Decodable {
    let total : Int
    let totalHits:Int
}
