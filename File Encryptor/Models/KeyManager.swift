//
//  KeyManager.swift
//  File Encryptor
//
//  Created by Jakub Schovanec on 09/10/2022.
//

import Foundation
import CryptoKit

struct KeyManager {
    // function that uses a password as input and derives a symmetric key for AES encryption from this password
    func derivedKeyFromPassword(_ password: String) -> SymmetricKey {
        // create SHA265 hash
        let hash = SHA256.hash(data: password.data(using: .utf8)!)
        // convert the SHA256 hash to a 64 byte string
        let hashString = hash.map { String(format: "%02hhx", $0)}.joined()
        // convert to 32 byte string
        let subString = String(hashString.prefix(32))
        // convert the substring to data
        let keyData = subString.data(using: .utf8)!
        // create the symmetric key and use data as seed
        return SymmetricKey(data: keyData)
    }
}
