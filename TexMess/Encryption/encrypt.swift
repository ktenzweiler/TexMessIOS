//
//  encrypt.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/17/23.
//

import Foundation
import CryptoKit

func encrypt(text: String, symmetricKey: SymmetricKey) throws -> String {
    let textData = text.data(using: .utf8)!
    let encrypted = try AES.GCM.seal(textData, using: symmetricKey)
    return encrypted.combined!.base64EncodedString()
}
