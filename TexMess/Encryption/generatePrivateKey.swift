//
//  generatePrivateKey.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 4/17/23.
//

import Foundation
import CryptoKit

func generatePrivateKey() -> P256.KeyAgreement.PrivateKey {
    let privateKey = P256.KeyAgreement.PrivateKey()
    return privateKey
}
