//
//  HomeView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 02/10/2024.
//

import SwiftUI

struct HomeView: View {
    @State var searchFeildText: String
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 15) {
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
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 47, height: 47)
                        .scaledToFit()
                    
                }
                
                HStack() {
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .padding([.leading,.trailing], 10)
                        TextField("Search", text: $searchFeildText)
                            .keyboardType(.default)
                    }
                    .frame(width: .infinity, height: 51)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                    .shadow(radius: 8)
                    
                    CustomButton(title: nil, backgroundColor: .red, foregroundColor: .white,icon: "line.3.horizontal.decrease")
                        .frame(width: 54, height: 51)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Text("Popular Near You")
                            .font(.custom("Inter", size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    
                    ScrollView(.horizontal)  {
                        HStack(spacing: 25) {
                            ProductView(image: "drumsteak", title: "Drumsteak Thai Ha", desc: "Western Cuisine, Fast Food", price: "$250", rating: "4.2")
                            ProductView(image: "drumsteak", title: "Drumsteak Thai Ha", desc: "Western Cuisine, Fast Food", price: "$250", rating: "4.2")
                        }
                        .padding(.all, 2)
                    }
                    
                    
                }
                ScrollView(.horizontal)  {
                    HStack(spacing: 15) {
                        ProductCategoryView(image: "pizzaCat", name: "Pizza")
                        ProductCategoryView(image: "burgerCat", name: "Burger")
                        ProductCategoryView(image: "saladCat", name: "Salad")
                        ProductCategoryView(image: "rameCat", name: "Rame")
                        ProductCategoryView(image: "hotdogCat", name: "Hot Dog")
                        
                    }
                    .padding(.all, 8)
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Recommended")
                            .font(.custom("Inter", size: 16))
                            .fontWeight(.medium)
                            .foregroundStyle(.black)
                        Spacer()
                    }
                    
                    ScrollView(.horizontal)  {
                        HStack(spacing: 25) {
                            ProductView(image: "drumsteak", title: "Drumsteak Thai Ha", desc: "Western Cuisine, Fast Food", price: "$250", rating: "4.2")
                            ProductView(image: "drumsteak", title: "Drumsteak Thai Ha", desc: "Western Cuisine, Fast Food", price: "$250", rating: "4.2")
                        }
                        .padding(.all, 2)
                    }
                    
                    
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    HomeView(searchFeildText: "")
}
