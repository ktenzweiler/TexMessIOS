//
//  exportPublicKey.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/17/23.
//

import Foundation
import CryptoKit

func exportPublicKey(_ publicKey: P256.KeyAgreement.PublicKey) -> String {
    let rawPublicKey = publicKey.rawRepresentation
    let base64PublicKey = rawPublicKey.base64EncodedString()
    let encodedPublicKey = base64PublicKey.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
    return encodedPublicKey
}
