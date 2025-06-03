//
//  importPrivateKey.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/17/23.
//

import Foundation
import CryptoKit

func importPrivateKey(_ privateKey: String) throws -> P256.KeyAgreement.PrivateKey {
    let privateKeyBase64 = privateKey.removingPercentEncoding!
    let rawPrivateKey = Data(base64Encoded: privateKeyBase64)!
    return try P256.KeyAgreement.PrivateKey(rawRepresentation: rawPrivateKey)
}
