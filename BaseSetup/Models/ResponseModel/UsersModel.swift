//
//  UsersModel.swift
//  BaseSetup
//
//  Created by iOS Dev on 03/12/21.
//

import Foundation

// MARK: - User
struct User: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

typealias UsersModel = [User]

