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
    
    func showSavePanel() -> URL? {
        let savePanel = NSSavePanel()
        let contentType = UTType("com.schovanec.fileEncryptor.EncryptedData")
        
        savePanel.allowedContentTypes = [contentType!]
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
