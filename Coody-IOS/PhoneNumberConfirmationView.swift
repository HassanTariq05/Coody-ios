//
//  PhoneNumberConfirmationView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 23/09/2024.
//

import SwiftUI

struct PhoneNumberConfirmationView: View {
    @State var phoneNumber: String
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white])
                           , startPoint: .leading, endPoint: .trailing)
            .opacity(0.2)
            
            VStack {
                VStack(spacing: 20) {
                    Text("Sign in with phone number")
                        .fontWeight(.medium)
                        .font(.custom("Inter", size: 16))
                        .foregroundStyle(Color.secondary)
                    
                    Text(phoneNumber)
                        .fontWeight(.bold)
                        .font(.custom("Inter", size: 20))
                        .foregroundStyle(Color.black)
                    
                    Text("We will send the authentication code to the phone number you entered. Do you want to continue?")
                        .fontWeight(.medium)
                        .font(.custom("Inter", size: 16))
                        .foregroundStyle(Color.secondary)
                        .frame(maxWidth: 292)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        CustomButton(
                            title: "Cancel",
                            action: { print("Sign In") },
                            backgroundColor: .white,
                            foregroundColor: .black
                        )
                        CustomButton(
                            title: "Next",
                            action: { print("Sign In") },
                            backgroundColor: .red,
                            foregroundColor: .white
                        )
                    }
                    .padding()
                    
                }
                .padding()
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .circular))
                .shadow(radius: 10)
            }
            .padding()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    PhoneNumberConfirmationView(phoneNumber: "(+91)651231141573")
}
