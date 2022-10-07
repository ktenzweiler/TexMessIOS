//
//  Constants.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/11/22.
//

import Foundation

struct K {
    static let appName = "⚡️FlashChat"
    static let cellIdentifier = "ReusableCell"
    static let convoCellIdentifier = "ConversationCell"
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
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
