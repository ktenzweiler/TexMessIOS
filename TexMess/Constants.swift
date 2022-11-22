//
//  Constants.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/11/22.
//

import Foundation

struct K {
    static let appName = "⚡️FlashChat"
    static let invitationCellId = "InvitationCell"
    static let invitationCellNibName = "InvitationCell"
    static let messageCellId = "MessageCell"
    static let convoCellId = "ConversationCell"
    static let cellNibName = "MessageCell"
    static let registerSegue = "RegisterToChat"
    static let loginSegue = "LoginToChat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let users = "users"
        static let messages = "messages"
        static let conversations = "conversations"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
    
    struct KeyChain {
        static let SIGNING_KEY = "SIGNING_KEY"
        static let PUBLIC_KEY = "PUBLIC_KEY"
    }
}
