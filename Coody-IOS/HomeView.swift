//
//  HomeView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 02/10/2024.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Delivery to")
                        .fontWeight(.medium)
                        .font(.custom("Inter", size: 18))
                        .foregroundStyle(.black)
                    
                    HStack() {
                        Image(systemName: "location")
                            .resizable()
                            .frame(width: 22, height: 22)
                            .scaledToFit()
                            .foregroundStyle(.red)
                        Text("Karachi, Pakistan")
                            .font(.custom("Inter", size: 16))
                            .foregroundStyle(.gray)
                    }
                    
                }
                Spacer()
                Image("logo")
                    .resizable()
                    .frame(width: 47, height: 47)
                    .scaledToFit()
                
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
