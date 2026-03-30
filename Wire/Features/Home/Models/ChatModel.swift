//
//  ChatModel.swift
//  Wire
//
//  Created by kartikay on 27/03/26.
//

import Foundation

struct Chat: Identifiable {
    let id = UUID()
    let name: String
    let message: String
    let time: String
}
