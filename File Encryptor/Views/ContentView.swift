//
//  ContentView.swift
//  File Encryptor
//
//  Created by Jakub Schovanec on 29/09/2022.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var cipherVM: FileCipherViewModel
    var body: some View {
        
        VStack {
            Button("Select a file") {
                cipherVM.selectFile()
            }
            HStack {
                Button("Encrypt") {
                    cipherVM.encrypt()
                }
                Button("Decrypt") {
                    cipherVM.decrypt()
                }
            }
            
        }
        .padding()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let cipherVM = FileCipherViewModel()
        ContentView(cipherVM: cipherVM)
    }
}
