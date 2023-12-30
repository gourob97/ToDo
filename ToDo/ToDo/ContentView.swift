//
//  ContentView.swift
//  ToDo
//
//  Created by Gourob Mazumder on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    
    var body: some View {
        if isActive {
            Text("Hello")
        } else {
            SplashScreen()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        isActive = true
                    }
                }
        }
    }
}

#Preview {
    ContentView()
}
