//
//  SplashView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 28/09/2024.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        Color.white
            .ignoresSafeArea()
            .overlay(
                ZStack {
                    Image("launchBG")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    Image("logo")
                        .resizable()
                        .frame(maxWidth: 120,maxHeight: 120)
                        .scaledToFit()
                }
            )
    }
}

#Preview {
    SplashView()
}
