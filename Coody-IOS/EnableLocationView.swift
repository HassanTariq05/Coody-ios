//
//  EnableLocationView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 02/10/2024.
//

import SwiftUI

struct EnableLocationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("locationIllustration")
                .resizable()
                .frame( width: 300, height: 300, alignment: .center)
                .scaledToFit()
                .padding(.bottom, 10)
            
            VStack(spacing: 0) {
                Text("Enable Your")
                    .foregroundStyle(Color.black)
                    Text("Location")
                        .foregroundStyle(.red)
            }
            .font(.custom("Roboto", size: 32))
            .bold()

            Text("To search for the best nearby driver, we want to know your current location")
                .multilineTextAlignment(.center)
                .frame(width: 280, height: 43)
                .fontWeight(.medium)
                .foregroundColor(.gray)
                .font(.custom("Roboto", size: 16))
                .padding(.bottom, 10)
            
            CustomButton(title: "Use current location", backgroundColor: .red, foregroundColor: .white, icon: "location")
            
            Text("Skip for now")
                .foregroundStyle(.gray)
                .font(.custom("Roboto", size: 16))
        }
        .padding()
    }
}

#Preview {
    EnableLocationView()
}
