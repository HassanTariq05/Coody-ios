//
//  HomeView.swift
//  Coody-IOS
//
//  Created by Hassan Tariq on 02/10/2024.
//

import SwiftUI

struct HomeView: View {
    @State var searchFeildText: String = ""
    @State private var selectedTab: String = "Featured"
    @FocusState var isSearchFieldFocused: Bool
    @State var showFilterView: Bool = false
    
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView(.vertical, showsIndicators: false) {
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
                                .focused($isSearchFieldFocused)
                            if isSearchFieldFocused {
                                Button(action: {isSearchFieldFocused.toggle()}) {
                                    Image(systemName: "xmark")
                                        .foregroundColor(.gray)
                                        .padding([.leading,.trailing], 10)
                                }
                                
                            }
                            
                        }
                        .frame(width: .infinity, height: 51)
                        .background(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .circular))
                        .shadow(radius: 1)
                        .tint(.red)
    //                    .onChange(of: isSearchFieldFocused) {
    //                        RecentSearchView()
    //                    }
                        
                        CustomButton(title: nil, action: {showFilterView.toggle()}, backgroundColor: .red, foregroundColor: .white,icon: "line.3.horizontal.decrease")
                            .frame(width: 54, height: 51)
                    }
                    
                    if isSearchFieldFocused {
                        RecentSearchesView()
                    }
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Popular Near You")
                                .font(.custom("Inter", size: 16))
                                .fontWeight(.medium)
                                .foregroundStyle(.black)
                            Spacer()
                            Button(action: {}) {
                                Text("View more")
                                    .font(.custom("Inter", size: 14))
                                    .fontWeight(.medium)
                                    .foregroundStyle(.red)
                            }
                            
                        }
                        .padding([.leading, .trailing], 10)
                        
                        ScrollView(.horizontal, showsIndicators: false)  {
                            HStack(spacing: 25) {
                                PopularProductView(image: "drumsteak", title: "Drumsteak Thai Ha", desc: "Western Cuisine, Fast Food", price: "$250", rating: "4.2")
                                PopularProductView(image: "drumsteak", title: "Drumsteak Thai Ha", desc: "Western Cuisine, Fast Food", price: "$250", rating: "4.2")
                            }
                            .padding(.all, 2)
                        }
                        
                        
                    }
                    .padding(.top, 5)
                    ScrollView(.horizontal, showsIndicators: false)  {
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
                            Button(action: {}) {
                                Text("View more")
                                    .font(.custom("Inter", size: 14))
                                    .fontWeight(.medium)
                                    .foregroundStyle(.red)
                            }
                        }
                        .padding([.leading, .trailing], 10)
                        
                        ScrollView(.horizontal, showsIndicators: false)  {
                            HStack(spacing: 15) {
                                RecommendedProductView(image: "VegSalad", title: "Veg Salad", desc: "Western Cuisine", price: "150", rating: "4.2")
                                
                                RecommendedProductView(image: "asianGlazed", title: "Veg Salad", desc: "Western Cuisine", price: "150", rating: "4.1")
                                
                                RecommendedProductView(image: "VegSalad", title: "Veg Salad", desc: "Western Cuisine", price: "150", rating: "4.3")
                            }
                            .padding(.all, 2)
                        }
                        
                        
                    }
                    
                    HStack() {
                        TabButton(isSelected: selectedTab == "Featured", name: "Featured", action: {
                            selectedTab = "Featured"
                        })
                        Spacer()
                        TabButton(isSelected: selectedTab == "Popular", name: "Popular", action: {
                            selectedTab = "Popular"
                        })
                        Spacer()
                        TabButton(isSelected: selectedTab == "Newest", name: "Newest", action: {
                            selectedTab = "Newest"
                        })
                        Spacer()
                        TabButton(isSelected: selectedTab == "Trending", name: "Trending", action: {
                            selectedTab = "Trending"
                        })
                    }
                    
                    VStack(spacing: 10) {
                        HomeTabsProductView(image: "ChickenBurger", title: "Chicken Burger", desc: "Western Cuisine", price: "$120", rating: "4.1")
                        HomeTabsProductView(image: "ChickenBurger", title: "Chicken Burger", desc: "Western Cuisine", price: "$120", rating: "4.1")
                        HomeTabsProductView(image: "ChickenBurger", title: "Chicken Burger", desc: "Western Cuisine", price: "$120", rating: "4.1")
                    }
                    Spacer()
                }
                .padding()
            }
            if showFilterView {
                SlideOverCard {
                    SearchByFilterView(showFilterView: $showFilterView)
                }
            }
        }
        
    }
}

struct TabButton: View {
    var isSelected: Bool
    var name: String
    var action: (() -> Void)?
    
    var body: some View {
        VStack {
            Button(action: {
                (action ?? {})()
            }) {
                Text(name)
                    .font(.custom("Inter", size: 18))
                    .foregroundStyle(isSelected ? .red : .black)
            }
            if isSelected {
                Divider()
                    .overlay(.red)
                    .frame(width: 80)
            }
            
        }
        
    }
}

#Preview {
    HomeView(searchFeildText: "")
}
