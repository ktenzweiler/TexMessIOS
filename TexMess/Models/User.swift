//
//  User.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 10/6/22.
//

import Foundation

struct User {
    let firstName: String?
    let lastName: String?
    let email: String?
    let publicKey: String?
    let signingKey: String?
    let conversations: Array<String>?
    let invitations: Array<String>?
    let blockedUsers: Array<String>?
}
