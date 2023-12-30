//
//  ContentView.swift
//  ToDo
//
//  Created by Gourob Mazumder on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    @State var isActive = false
    @State var selectedTab: Tab = .pending
    var body: some View {
        if isActive {
            VStack {
                ViewThatFits {
                    TabView(selectedTab: $selectedTab)
                    ScrollView(.horizontal){
                        TabView(selectedTab: $selectedTab)
                    }
                    .scrollIndicators(.hidden)
                }
                .background {
                    Color.accentColor.opacity(0.2)
                        .ignoresSafeArea(edges:[.top, .horizontal])
                }
                switch selectedTab {
                case .pending:
                    Text("Pending items")
                case .completed:
                    Text("Completed items")
                case .overdue:
                    Text("Overdure items")
                }
                Spacer()
            }
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
