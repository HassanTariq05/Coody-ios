//
//  ForgotPasswordView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 02/10/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @State var text: String
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 76,height: 76)
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            .padding(.bottom, 10)
            HStack {
                Text("Forgot")
                Text("Password")
                    .foregroundColor(.red)
                Spacer()
            }
            .font(.custom("Inter", size: 28))
            .bold()
            
            HStack {
                Text("Enter your phone number we sent OTP for verification.")
                    .bold()
                    .font(.custom("Inter", size: 16))
                    .foregroundColor(.secondary)
                Spacer()
            }
        
            CustomTextField(label: "Phone Number", text: $text, placeholder: "",keyboardType: .numberPad, icon: "phone.fill")
            
            Spacer()
            CustomButton(title: "Next", action: {
                print("next pressed")
            }, backgroundColor: .red, foregroundColor: .white, borderColor: .red)
        }
        .padding()
    }
}

#Preview {
    ForgotPasswordView(text: "")
}
