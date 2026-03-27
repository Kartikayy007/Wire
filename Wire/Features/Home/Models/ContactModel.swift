//
//  ContactModel.swift
//  Wire
//
//  Created by kartikay on 27/03/26.
//

import Foundation
import SwiftData

@Model
class ContactModel {
    var id: String
    var givenName: String
    var familyName: String
    var phoneNumbers: [String]
    
    init(id: String, givenName: String, familyName: String, phoneNumbers: [String]) {
        self.id = id
        self.givenName = givenName
        self.familyName = familyName
        self.phoneNumbers = phoneNumbers
    }
}

