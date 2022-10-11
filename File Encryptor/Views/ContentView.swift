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
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Encrypt") {
                do {
                    try cipherVM.showSavePanel()
                } catch {
                    print(error)
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
