//
//  importPublicKey.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/17/23.
//

import Foundation
import CryptoKit

func importPublicKey(_ publicKey: String) throws -> P256.KeyAgreement.PublicKey {
    let base64PublicKey = publicKey.removingPercentEncoding!
    let rawPublicKey = Data(base64Encoded: base64PublicKey)!
    let publicKey = try P256.KeyAgreement.PublicKey(rawRepresentation: rawPublicKey)
    return publicKey
}
