//
//  FileCipher.swift
//  File Encryptor
//
//  Created by Jakub Schovanec on 09/10/2022.
//

import Foundation
import CryptoKit

struct Cipher {
    func encryptCodableObject<T: Codable>(object: T, using key: SymmetricKey) throws -> Data {
        // convert to JSON
        let encoder = JSONEncoder()
        let userData = try encoder.encode(object)
        
        // encrypt data
        let encryptedData = try AES.GCM.seal(userData, using: key)
        // get cipher text combined with nonce and auth tag
        let combinedCipher = encryptedData.combined!
        // return the combined cipher
        return combinedCipher
    }
    func decryptCodableObject<T: Codable>(_ type: T.Type, from data: Data, using key: SymmetricKey) throws -> T {
        // put the data in a sealed box
        let box = try AES.GCM.SealedBox(combined: data)
        // extract the data using the key
        let decryptedData = try AES.GCM.open(box, using: key)
        // decrypted block needs to be JSON decoded
        let decoder = JSONDecoder()
        let object = try decoder.decode(type, from: decryptedData)
        // return the new object
        return object
    }
}
