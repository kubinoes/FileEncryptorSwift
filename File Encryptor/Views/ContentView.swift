//
//  ContentView.swift
//  File Encryptor
//
//  Created by Jakub Schovanec on 29/09/2022.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
            Button("Encrypt") {
                openFilePicker()
            }
        }
        .padding()
    }
    
}

func openFilePicker() {
    let dialog = NSOpenPanel()
    
    dialog.title = "Choose a file you wish to encrypt"
    dialog.showsResizeIndicator = true
    dialog.showsHiddenFiles = false
    dialog.allowsMultipleSelection = true
    dialog.canChooseFiles = true
    dialog.canChooseDirectories = true
    
    if dialog.runModal() == NSApplication.ModalResponse.OK {
        let results = dialog.urls // pathname of the file
        
        for result in results {
            // TODO call for encryption from viewmModel
            
        }
    } else { return }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
