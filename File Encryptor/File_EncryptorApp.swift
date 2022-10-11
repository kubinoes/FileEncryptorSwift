//
//  File_EncryptorApp.swift
//  File Encryptor
//
//  Created by Jakub Schovanec on 29/09/2022.
//

import SwiftUI

@main
struct File_EncryptorApp: App {
    let cipherVM = FileCipherViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(cipherVM: cipherVM)
        }
    }
}
