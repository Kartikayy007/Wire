//
//  UserModel.swift
//  Wire
//
//  Created by kartikay on 26/03/26.
//

import Foundation

struct UserModel {
    let id: String
    let email: String
    let phoneNumber: String
}

struct UserLookupResponse: Codable {
    let registered: [String]
    let notFound: [String]
    
    enum CodingKeys: String, CodingKey {
        case registered
        case notFound = "not_found"
    }
}


