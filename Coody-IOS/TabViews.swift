//
//  TabViews.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 03/10/2024.
//

import SwiftUI

struct TabViews: View {
    var body: some View {
        TabView {
            HomeView(searchFeildText: "")
                .tabItem {
                    Image(systemName: "house")
                }
            IntroView()
                .tabItem {
                    Image(systemName: "heart")
                }
            IntroView()
                .tabItem {
                    Image(systemName: "bag")
                }
            IntroView()
                .tabItem {
                    Image(systemName: "bell")
                }
        }
        .tint(.red)
                .onAppear(perform: {
                    UITabBar.appearance().unselectedItemTintColor = .darkGray
                    UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.4)
                })
    }
}

#Preview {
    TabViews()
}
