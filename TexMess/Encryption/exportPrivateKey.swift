//
//  exportPrivateKey.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/17/23.
//

import Foundation
import CryptoKit

func exportPrivateKey(_ privateKey: P256.KeyAgreement.PrivateKey) -> String {
    let rawPrivateKey = privateKey.rawRepresentation
    let privateKeyBase64 = rawPrivateKey.base64EncodedString()
    let percentEncodedPrivateKey = privateKeyBase64.addingPercentEncoding(withAllowedCharacters: .alphanumerics)!
    return percentEncodedPrivateKey
}
