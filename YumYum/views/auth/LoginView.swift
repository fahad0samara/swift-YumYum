//
//  LoginView.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        VStack {
    Spacer()
            
            Text("Welcome Back to YumYum")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.orange)
                .padding(.bottom, 30)
            
            VStack(spacing: 20) {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                Button(action: {
                    // Action for login button
                }) {
                    Text("Log In")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                
                NavigationLink(destination: ForgotPasswordView()) {
                    Text("Forgot Password?")
                        .font(.caption)
                        .foregroundColor(.orange)
                        .underline()
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
            
            Spacer()
            
            HStack {
                Text("Don't have an account?")
                    .font(.caption)
                    .foregroundColor(.gray)
                
                NavigationLink{
                    SignUpView().navigationBarBackButtonHidden(true)
                    
                } label:{
                    
                    
                    Text("Sign Up")
                        .font(.caption)
                        .foregroundColor(.orange)
                        .underline()
                }
            }
            .padding(.horizontal)
        }
        .padding()
    }
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
