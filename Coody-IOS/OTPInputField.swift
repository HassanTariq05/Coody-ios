//
//  OTPInputField.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 30/09/2024.
//

import SwiftUI

struct OTPInputField: View {
    @State var value: [String]
    
    @FocusState private var feildFocus: Int?
    
    let numberOfDigit: Int
    
    let oldValue = ""
    
    init(numberOfDigit: Int) {
        self.value = Array(repeating: "", count: numberOfDigit)
        self.numberOfDigit = numberOfDigit
    }
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfDigit, id: \.self) { index in
                TextField("", text: $value[index])
                .frame(width: 50,height: 50, alignment: .center)
                    .keyboardType(.numberPad)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray, lineWidth: 2))
                    .fixedSize()
                    .font(.custom("Inter", fixedSize: 32))
                    .tint(Color.red)
                    .multilineTextAlignment(.center)
                    .focused($feildFocus, equals: index)
                    .tag(index)
                    .onChange(of: value[index]) {
                        if value[index].count > 1 {
                            let currentValue = Array(value[index])
                            
                            if currentValue[index] == Character(oldValue) {
                                value[index] = String(value[index].suffix(1))
                            } else {
                                value[index] = String(value[index].prefix(1))
                            }
                        }
                        
                        if !value[index].isEmpty {
                            if index == numberOfDigit - 1 {
                                feildFocus = nil
                            } else {
                                feildFocus = (feildFocus ?? 0) + 1
                            }
                        } else {
                            feildFocus = (feildFocus ?? 0) - 1
                        }
                        
                    }
            }
        }
    }
}

#Preview {
    OTPInputField(numberOfDigit: 6)
}
