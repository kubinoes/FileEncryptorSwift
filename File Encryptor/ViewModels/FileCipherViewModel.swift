//
//  MainViewModel.swift
//  File Encryptor
//
//  Created by Jakub Schovanec on 09/10/2022.
//

import SwiftUI
import UniformTypeIdentifiers

class FileCipherViewModel: ObservableObject {
    @Published var cipher: Cipher
    var keyManager: KeyManager
    
    init() {
        self.cipher = Cipher()
        self.keyManager = KeyManager()
    }
    
    func encrypt() {
        let key = keyManager.derivedKey(form: "pizza")
        if let readUrl = showOpenPanel() {
            do {
                let encryptedData = try cipher.encryptCodableObject(object: Data(contentsOf: readUrl), using: key)
                let contentTypeArray = [UTType("com.schovanec.fileEncryptor.EncryptedData")!]
                if let writeUrl = showSavePanel(contentTypeArray: contentTypeArray) {
                    print(writeUrl)
                    try encryptedData.write(to: writeUrl)
                }
            } catch {
                print("Encryption failed")
                print(error)
            }
        }
    }
    
    func decrypt() {
        let key = keyManager.derivedKey(form: "pizza")
        if let readUrl = showOpenPanel() {
            do {
                let decryptedData = try cipher.decryptCodableObject(Data.self, from: Data(contentsOf: readUrl), using: key)
                // empty array to default the save panel to allow any type
                let contentTypeArray = [UTType]()
                if let writeUrl = showSavePanel(contentTypeArray: contentTypeArray) {
                    try decryptedData.write(to: writeUrl)
                }
            } catch {
                print("Decryption failed")
                print(error)
            }
        }
    }
    
    func showOpenPanel() -> URL? {
        let openPanel = NSOpenPanel()
        
        openPanel.title = "Choose a file you wish to encrypt"
        openPanel.showsResizeIndicator = true
        openPanel.showsHiddenFiles = false
        openPanel.allowsMultipleSelection = false // TODO add multiple files encryption and decryption
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = true
        
        let response = openPanel.runModal()
        return response == .OK ? openPanel.url : nil
    }
    func showSavePanel(contentTypeArray: [UTType]) -> URL? {
        let savePanel = NSSavePanel()
        
        savePanel.allowedContentTypes = contentTypeArray
        savePanel.canCreateDirectories = true
        savePanel.isExtensionHidden = false
        savePanel.allowsOtherFileTypes = false
        savePanel.title = "Save your encrypted file"
        savePanel.message = "Choose a folder and a name for your encrypted file."
        savePanel.nameFieldLabel = "File name:"
        savePanel.nameFieldStringValue = "" // TODO put a name of the original file here
        
        let response = savePanel.runModal()
        return response == .OK ? savePanel.url : nil
    }
}
