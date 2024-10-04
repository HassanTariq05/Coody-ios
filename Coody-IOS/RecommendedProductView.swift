//
//  RecommendedProductView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 04/10/2024.
//

import SwiftUI

struct RecommendedProductView: View {
    var image: String
    var title: String
    var desc: String
    var price: String
    var rating: String
    
    var body: some View {
        VStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 142, height: 116)
            Spacer()
            HStack {
                VStack(spacing: 3) {
                    HStack {
                        Text(title)
                            .foregroundStyle(.black)
                            .font(.custom("Inter", size: 14))
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(.top, 3)
                    HStack {
                        Text(desc)
                            .foregroundStyle(.gray)
                            .font(.custom("Inter", size: 10))
                            .fontWeight(.medium)
                        Spacer()
                    }
                    HStack {
                        Text(price)
                            .foregroundStyle(.black)
                            .font(.custom("Inter", size: 12))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.top, 1)
                }
                VStack {
                    Spacer()
                    HStack {
                        HStack(spacing: 2) {
                            Text(rating)
                                .foregroundStyle(.white)
                                .font(.custom("Roboto", size: 14))
                                .bold()
                                
                            Image(systemName: "star")
                                .resizable()
                                .foregroundStyle(.white)
                                .scaledToFit()
                                .frame(width: 12, height: 15, alignment: .center)
                                
                        }
                        
                        
                    }
                    .padding(.all, 3)
                    .background(Color.green)
                    .cornerRadius(6)
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.green, lineWidth: 1))
                    
                }
            }
            
        }
        .padding()
        .frame(width: 157, height: 196)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("grayOutlineColor"), lineWidth: 1))
        
    }
}

#Preview {
    RecommendedProductView(image: "VegSalad", title: "Veg Salad", desc: "Western Cuisine", price: "150", rating: "4.5")
}
