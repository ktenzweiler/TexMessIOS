//
//  Invitation.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 10/6/22.
//

import Foundation

struct Invitation {
    let id: String
    let conversationId: String?
    let originatorId: String?
    let originatorName: String
    let originatorPublicKey: String
    let originatorSigningKey: String
    let recipientsNames: Array<String?>?
    let recipientIdsSalt: Array<IdsSalt?>?
}

struct IdsSalt {
    let id: String
    let cipherSalt: String
    let saltSignature: String
    let publicKey: String
}
