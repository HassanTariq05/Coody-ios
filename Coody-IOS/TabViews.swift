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
                    VStack {
                        Image(systemName: "house")
                            .padding(.top, 10) // Apply top padding here
                    }
                }
            IntroView()
                .tabItem {
                    VStack {
                        Image(systemName: "heart")
                            .padding(.top, 10)
                    }
                }
            IntroView()
                .tabItem {
                    VStack {
                        Image(systemName: "bag")
                            .padding(.top, 10)
                    }
                }
            IntroView()
                .tabItem {
                    VStack {
                        Image(systemName: "bell")
                            .padding(.top, 10)
                    }
                }
        }
        .tint(.red)
        .onAppear(perform: {
            UITabBar.appearance().unselectedItemTintColor = .darkGray
            UITabBar.appearance().backgroundColor = .systemGray4.withAlphaComponent(0.1)
        })
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    TabViews()
}

