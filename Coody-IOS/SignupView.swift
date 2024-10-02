import SwiftUI

struct SignupView: View {
    @State public var phoneNumber: String
    @State public var password: String
    
    var body: some View {
        VStack(spacing: 15) {
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
                
                Text("Please enter your sign up details.")
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
                CustomTextField(
                    label: "Re-Enter Password",
                    text: $password,
                    placeholder: "Re-Enter Password",
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
                    CustomButton(
                        title: "Sign In",
                        action: { print("Sign In") },
                        backgroundColor: .red,
                        foregroundColor: .white
                    )
                    
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
        }
        .padding([.leading, .trailing])
        
        
    }
}

#Preview {
    SignupView(phoneNumber: "", password: "")
}
