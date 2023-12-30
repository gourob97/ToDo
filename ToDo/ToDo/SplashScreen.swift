//
//  SplashScreen.swift
//  ToDo
//
//  Created by Gourob Mazumder on 30/12/23.
//

import SwiftUI

struct SplashScreen: View {
    @State var opacity = 0.1
    @State var scale = 0.5
    
    var body: some View {
        ZStack {
            Color.clear.ignoresSafeArea()
            VStack(spacing: 20){
                Image(systemName: SplashScreenConstants.logoTodo)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 200)
                    .foregroundColor(.accentColor.opacity(opacity))
                    .scaleEffect(scale)
                    .onAppear {
                        withAnimation(.easeInOut(duration: 2)) {
                            opacity = 1
                        }
                        withAnimation(.spring(.snappy(duration: 2), blendDuration: 2)) {
                            scale = 1
                        }
                    }
                Text(SplashScreenConstants.textTodo)
                    .scaleEffect(scale)
                    .foregroundColor(.accentColor.opacity(opacity))
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                    .onAppear {
                        withAnimation(.spring(.snappy(duration: 2), blendDuration: 2)) {
                            scale = 1
                        }
                        withAnimation(.easeInOut(duration: 2)) {
                            opacity = 1
                        }
                    }
            }
        }
    }
}

#Preview {
    SplashScreen()
        .preferredColorScheme(.light)
}
