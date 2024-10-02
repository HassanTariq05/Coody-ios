//
//  ProductView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 02/10/2024.
//

import SwiftUI

struct ProductView: View {
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
                .frame(width: 230, height: 156)
                .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
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
        .frame(width: 253, height: 245)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color.gray, lineWidth: 1))
        
    }
}

#Preview {
    ProductView(image: "drumsteak", title: "Drumsteak Thai Ha", desc: "Western Cuisine, Fast Food", price: "$250", rating: "4.2")
}
