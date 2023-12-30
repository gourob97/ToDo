//
//  TabView.swift
//  ToDo
//
//  Created by Gourob Mazumder on 30/12/23.
//

import SwiftUI

struct TabView: View {
    @Binding var selectedTab: Tab
    
    var body: some View {
        HStack {
            ForEach(Tab.allCases, id: \.self) { tab in
                Spacer()
                Text(tab.rawValue)
                    .foregroundColor(selectedTab == tab ? Color.white : nil)
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(selectedTab == tab ? .accent : .clear)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            selectedTab = tab
                        }
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(
                                selectedTab == tab ? Color.accentColor.opacity(0.7) : Color.accentColor,
                                lineWidth: selectedTab == tab ? 2 : 1
                            )
                    }
                Spacer()
            }
        }
        .padding()
    }
}

#Preview {
    TabView(selectedTab: .constant(Tab.pending))
}
