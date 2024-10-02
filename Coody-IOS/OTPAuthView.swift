//
//  OTPAuthView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 24/09/2024.
//

import SwiftUI

struct OTPAuthView: View {
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Image("logo")
                    .resizable()
                    .frame(width: 76,height: 76)
                    .aspectRatio(contentMode: .fit)
                Spacer()
            }
            HStack {
                Text("Enter")
                Text("OTP")
                    .foregroundColor(.red)
                Spacer()
            }
            .font(.custom("Inter", size: 28))
            .bold()
            .padding(.bottom, 10)
            
            HStack {
                Text("A verification code has been sent to (+91) 65485 8XX98")
                    .bold()
                    .font(.custom("Inter", size: 16))
                    .foregroundColor(.secondary)
                Spacer()
            }
        
            HStack(spacing: 10) {
                OTPInputField(numberOfDigit: 6)
            }
            .padding(.top, 30)
            
            Spacer()
            CustomButton(title: "Next", action: {
                print("next pressed")
            }, backgroundColor: .red, foregroundColor: .white, borderColor: .red)
            
            HStack(spacing: 1) {
                Text("Didn't recieve the code?")
                    .foregroundStyle(Color.black)
                
                Text("Resend (30s)")
                    .foregroundStyle(Color.red)
            }
            .fontWeight(.medium)
            .font(.custom("Inter", size: 14))
            .padding(.top, 5)
        }
        .padding()
    }
}

#Preview {
    OTPAuthView()
}
