//
//  User.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 10/6/22.
//

import Foundation

struct User_ : Codable {
    let firstName: String?
    let lastName: String?
    let email: String?
    var publicKey: String?
    var signingKey: String?
    let conversations: Array<String>?
    let invitations: Array<String>?
    let blockedUsers: Array<String>?
    
    var dictionary: [String: Any?] {
        return ["firstName" : self.firstName,
                "lastName": self.lastName,
                "email": self.email,
                "publicKey": self.publicKey,
                "signingKey": self.signingKey,
                "invitations": self.invitations,
                "blockedUsers": self.blockedUsers]
    }
    
    init(firstName: String?, lastName: String?, email: String?, publicKey: String?, signingKey: String?,conversations: Array<String>?, invitations: Array<String>?, blockedUsers: Array<String>?) {
        self.firstName = firstName;
        self.lastName = lastName;
        self.email = email;
        self.publicKey = publicKey;
        self.conversations = conversations;
        self.signingKey = signingKey;
        self.invitations = invitations;
        self.blockedUsers = blockedUsers;
    }
    
//    init?(document: DocumentSnapshot) {
//        guard let dict = document.value as? [String: Any?] else { return nil }
//        guard let firstName = dict["firstName"] else { return nil }
//        guard let lastName = dict["lastName"] else { return nil }
//        guard let email = dict["email"] else { return nil }
//        guard let publicKey = dict["publicKey"] else { return nil }
//        guard let signingKey = dict["signingKey"] else { return nil }
//        guard let invitations = dict["invitations"] else { return nil }
//        guard let blockedUsers = dict["blockedUsers"] else { return nil }
//    }
}
