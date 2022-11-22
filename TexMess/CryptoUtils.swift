//
//  CryptoUtils.swift
//  TexMess
//
//  Created by Kyle Enzweiler on 10/18/22.
//

import Foundation

struct CryptoUtils {
    
    func hasKey(keyName: String) -> Bool {
        return true
    }
    
    func generateEncryptionKey() -> String? {
        
        return "IamaEncryptionKey"
    }
    
    func generateSigningKey() throws -> String? {
        let tag = "com.texdroid.TexMess.signingkey".data(using: .utf8)!
        let attributes: [String: Any] =
        [kSecAttrKeyType as String:            kSecAttrKeyTypeRSA,
             kSecAttrKeySizeInBits as String:      2048,
             kSecPrivateKeyAttrs as String:
                [kSecAttrIsPermanent as String:    true,
                 kSecAttrApplicationTag as String: tag]
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
