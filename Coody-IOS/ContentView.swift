//
//  ContentView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 28/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var isActive: Bool = false
    
    var body: some View {
        Color.white
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    if self.isActive {
                        IntroView()
                    } else {
                        SplashView()
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
                
            )
    }
}

#Preview {
    ContentView()
}
