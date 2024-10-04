//
//  ProductCategoryView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 03/10/2024.
//

import SwiftUI

struct ProductCategoryView: View {
    var image: String
    var name: String
    
    var body: some View {
        VStack {
            VStack {
            Image(image)
                .resizable()
                .frame(width: 44, height: 44)
                .scaledToFit()
            }
            .padding(.all, 8)
            .background(Color.white)
            .cornerRadius(6)
            .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.white, lineWidth: 0.5))
            .shadow(radius: 3, x: 0, y: 3)
            
            Text(name)
                .font(.custom("Inter", size: 14))
                .foregroundStyle(.black)
                .padding(.top, 2)
        }
    }
}

#Preview {
    ProductCategoryView(image: "pizzaCat", name: "Pizza")
}
