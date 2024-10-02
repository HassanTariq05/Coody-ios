import SwiftUI

struct LoginView: View {
    @State public var phoneNumber: String
    @State public var password: String
    
    var body: some View {
            VStack(spacing: 20) {
                HStack {
                    Image("logo")
                        .resizable()
                        .frame(width: 76, height: 76)
                        .aspectRatio(contentMode: .fit)
                    Spacer()
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text("Welcome")
                        Text("Cohort")
                            .foregroundColor(.red)
                        Spacer()
                    }
                    .font(.custom("Inter", size: 28))
                    .bold()
                    .padding(.bottom, 10)
                    
                    Text("Please enter your sign in details.")
                        .font(.custom("Inter", size: 16))
                        .foregroundColor(.secondary)
                }
                
                VStack(spacing: 20) {
                    CustomTextField(
                        label: "Phone Number",
                        text: $phoneNumber,
                        placeholder: "Enter Phone Number",
                        keyboardType: .phonePad,
                        icon: "phone.fill"
                    )
                    
                    CustomTextField(
                        label: "Password",
                        text: $password,
                        placeholder: "Enter Password",
                        isSecure: true,
                        icon: "eye.slash.fill"
                    )
                }
                .padding(.top)
                
                HStack {
                    Spacer()
                    Text("Forgot Password?")
                        .font(.custom("Inter", size: 14))
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                }
                
                VStack(spacing: 25) {
                    VStack(spacing: 15) {
                        NavigationLink(destination: OTPAuthView()) {
                            CustomButton(
                                title: "Sign In",
                                action: nil,
                                backgroundColor: .red,
                                foregroundColor: .white
                            )
                        }
                    }
                    
                    CustomButton(
                        title: "Sign Up",
                        action: { print("Sign Up") },
                        backgroundColor: .white,
                        foregroundColor: .red,
                        borderColor: .red
                    )
                }
                    
                    Text("Or Continue With")
                        .font(.custom("Inter", size: 16))
                        .foregroundColor(.secondary)
                    
                    HStack {
                        SocialLoginButton(imageName: "googleLogo", text: "Google", action: { print("Google Login") })
                        
                        SocialLoginButton(imageName: "facebookLogo", text: "Facebook", action: { print("Facebook Login") })
                    }
                }
            .toolbar(.hidden, for: .navigationBar)
            .padding([.leading, .trailing])
        }
        
    }

struct CustomTextField: View {
    var label: String
    @Binding var text: String
    var placeholder: String
    var keyboardType: UIKeyboardType = .default
    var isSecure: Bool = false
    var icon: String?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text(label)
                .font(.custom("Inter", size: 14))
            HStack {
                if isSecure {
                    SecureField(placeholder, text: $text)
                        .padding()
                        .keyboardType(keyboardType)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                } else {
                    TextField(placeholder, text: $text)
                        .padding()
                        .keyboardType(keyboardType)
                }
                if let icon = icon {
                    Image(systemName: icon)
                        .foregroundColor(.gray)
                        .padding(.trailing, 10)
                }
            }
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        }
    }
}

struct CustomButton: View {
    var title: String
    var action: (() -> Void)?
    var backgroundColor: Color
    var foregroundColor: Color
    var borderColor: Color = .clear
    var icon: String?
    
    var body: some View {
        Button(action: {
            action?()
        }) {
            HStack() {
                if let icon = icon {
                    Image(systemName: icon)
                        .resizable()
                        .frame(width: 20, height: 20)
                        .scaledToFit()
                        .foregroundColor(Color.white)
                }
                Text(title)
                    .foregroundColor(foregroundColor)
            }
            .frame(minWidth: 100, maxWidth: .infinity)
            .padding()
            .frame(height: 50)
            .background(backgroundColor)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(borderColor, lineWidth: 1)
            )
            .font(.custom("Inter", size: 18))
            .fontWeight(.medium)
        }
        .allowsHitTesting(action != nil)
    }
}


struct SocialLoginButton: View {
    var imageName: String
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Image(imageName)
                    .resizable()
                    .frame(width: 25, height: 25)
                    .aspectRatio(contentMode: .fit)
                Text(text)
                    .foregroundColor(.black)
            }
            .frame(maxWidth: .infinity)
            .frame(height: 50)
            .background(Color.white)
            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
        }
    }
}

#Preview {
    LoginView(phoneNumber: "", password: "")
}
