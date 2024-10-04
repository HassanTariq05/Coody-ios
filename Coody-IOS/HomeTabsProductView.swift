//
//  HomeTabProductView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 04/10/2024.
//

import SwiftUI

struct HomeTabsProductView: View {
    var image: String
    var title: String
    var desc: String
    var price: String
    var rating: String
    
    var body: some View {
        HStack {
            Image(image)
                .resizable()
                .scaledToFit()
                .frame(width: 113, height: 102)
                VStack(spacing: 3) {
                    HStack {
                        Text(title)
                            .foregroundStyle(.black)
                            .font(.custom("Inter", size: 16))
                            .fontWeight(.medium)
                        Spacer()
                    }
                    HStack {
                        Text(desc)
                            .foregroundStyle(.gray)
                            .font(.custom("Inter", size: 14))
                            .fontWeight(.medium)
                        Spacer()
                    }
                    .padding(.bottom, 8)
                    HStack {
                        Text(price)
                            .foregroundStyle(.black)
                            .font(.custom("Inter", size: 18))
                            .fontWeight(.bold)
                        Spacer()
                    }
                    .padding(.top, 1)
                }
                .padding(.leading, 8)
                VStack {
                    HStack(spacing: 4) {
                        Image(systemName: "clock")
                            .resizable()
                            .foregroundStyle(.red)
                            .scaledToFit()
                            .frame(width: 14, height: 17, alignment: .center)
                        Text("24 min")
                            .foregroundStyle(.black)
                            .font(.custom("Roboto", size: 14))
                            .fontWeight(.regular)
                    }
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
        .padding()
        .frame(width: .infinity, height: 120)
        .overlay(RoundedRectangle(cornerRadius: 12).stroke(Color("grayOutlineColor"), lineWidth: 1))
        
    }
}

#Preview {
    HomeTabsProductView(image: "ChickenBurger", title: "Chicken Burger", desc: "Western Cuisine", price: "$120", rating: "4.1")
}
