//
//  AllPostResponse.swift
//  Instagram
//
//  Created by ovais on 10/05/2023.
//

import Foundation

struct AllPostResponse : Decodable {
    let likes:Int?
    let views:Int?
    let imageUrl:String?
    let webUrl:String?
    let username:String?
}
