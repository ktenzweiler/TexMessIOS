//
//  CryptoUtils.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 10/18/22.
//

import Foundation

struct CryptoUtils {
    
    let LOCAL_SECRET_KEY = "LOCAL_SECRET_KEY"
    let SIGNING_KEY = "SIGNING_KEY"
    
    func hasKey(keyName: String) -> Bool {
        return true
    }
    
    func generateEncryptionKey() throws -> String? {
        
        let attributes: NSDictionary = [
            kSecAttrKeyType: kSecAttrKeyTypeECSECPrimeRandom,
            kSecAttrKeySizeInBits: 256,
            kSecAttrTokenID: kSecAttrTokenIDSecureEnclave,
            kSecPrivateKeyAttrs: [
                kSecAttrIsPermanent: true,
                kSecAttrApplicationTag: LOCAL_SECRET_KEY,
                kSecAttrAccessControl: access
            ]
        ]
        
        var error: Unmanaged<CFError>?
        guard let privateKey = SecKeyCreateRandomKey(attributes, &error) else {
            throw error!.takeRetainedValue() as Error
        }
        
        let publicKey = SecKeyCopyPublicKey(privateKey)
        
        guard let data = SecKeyCopyExternalRepresentation(publicKey!, &error) as? Data else {
            throw error!.takeRetainedValue() as Error
        }
        
        return  data.base64EncodedString()
    }
    
    func generateSigningKey() throws -> String? {
        let tag = SIGNING_KEY.data(using: .utf8)!
        let attributes: [String: Any] =
        [kSecAttrKeyType as String:            kSecAttrKeyTypeRSA,
             kSecAttrKeySizeInBits as String:      2048,
             kSecPrivateKeyAttrs as String:
                [kSecAttrIsPermanent as String:    true,
                 kSecAttrApplicationTag as String: tag] as [String : Any]
        ]
        
        var error: Unmanaged<CFError>?
        
        guard let privateKey = SecKeyCreateRandomKey(attributes as CFDictionary, &error) else {
            throw error!.takeRetainedValue() as Error
        }
        
        let publicKey = SecKeyCopyPublicKey(privateKey)
        
        guard let data = SecKeyCopyExternalRepresentation(publicKey!, &error) as? Data else {
            throw error!.takeRetainedValue() as Error
        }
        
        return  data.base64EncodedString()
    }
}
