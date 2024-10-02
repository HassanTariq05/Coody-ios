import SwiftUI

struct IntroView: View {
    var body: some View {
        NavigationView {
            BaseIntroView(image: "manHoldingPhone", textBlack: "Search Your", textRed: "Favorite Food", tagline: "Discover the foods from over all nearby restaurants", nextIcon: "nextIcon", destination: SecondIntroView())
                
        }
//        .toolbarTitleMenu(content: "")
        
    }
}

struct SecondIntroView: View {
    var body: some View {
        BaseIntroView(image: "pizzaIntro", textBlack: "Browse Your", textRed: "Menu", tagline: "Discover the foods from over all nearby restaurants", nextIcon: "nextIcon", destination: ThirdIntroView())
            .toolbar(.hidden, for: .navigationBar)
    }
}

struct ThirdIntroView: View {
    var body: some View {
        BaseIntroView(image: "pizzaGuy", textBlack: "Get Fastest", textRed: "Delivery", tagline: "Discover the foods from over all nearby restaurants", nextIcon: "nextIcon", destination: LoginView(phoneNumber: "", password: ""))
            .toolbar(.hidden, for: .navigationBar)
    }
}

struct BaseIntroView<Destination>: View where Destination: View {
    var image: String
    var textBlack: String
    var textRed: String
    var tagline: String
    var nextIcon: String
    var destination: Destination
    
    var body: some View {
    Color.white
        .ignoresSafeArea()
        .overlay(
            VStack(spacing: 20) {
                HStack {
                    Spacer()
                    NavigationLink(destination: LoginView(phoneNumber: "", password: "")) {
                        Text("Skip")
                            .font(.custom("Inter", size: 16))
                            .fontWeight(.medium)
                            .padding(.trailing)
                    }
                    
                }
                .padding(.top, 40)

                Image(image)
                    .resizable()
                    .frame(width: 400, height: 400)
                    .scaledToFit()

                VStack(spacing: 0) {
                    Text(textBlack)
                        .foregroundStyle(Color.black)
                    HStack {
                        Text(textRed)
                            .foregroundStyle(.red)
                    }
                }
                .font(.custom("Roboto", size: 32))
                .bold()
                .padding(.bottom, 10)

                Text(tagline)
                    .multilineTextAlignment(.center)
                    .frame(width: 216, height: 43)
                    .fontWeight(.medium)
                    .foregroundColor(.gray)
                    .font(.custom("Roboto", size: 16))
                    .padding(.horizontal)


                NavigationLink(destination: destination) {
                    Image(nextIcon)
                        .resizable()
                        .frame(width: 133, height: 133)
                        .scaledToFit()
                        .padding()
                }
                
            }
            .padding()
        )
    }
}

#Preview {
    IntroView()
}
