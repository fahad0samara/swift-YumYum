//
//  SignUpView.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
    var body: some View {
        NavigationStack{
            VStack {
              Spacer()
                Text("Welcome to YumYum")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
                    .padding(.bottom, 30)
                
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                SecureField("Confirm Password", text: $confirmPassword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                    .padding(.bottom, 20)
                
                NavigationLink(destination: TabViewNav().navigationBarBackButtonHidden(true)){
                    
                    
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.orange)
                        .cornerRadius(10)
                }
                .padding(.bottom, 20)
                
                
                HStack {
                    Text("Already have an account?")
                        .font(.caption)
                        .foregroundColor(.gray)
                    
                    NavigationLink(destination: LoginView().navigationBarBackButtonHidden(true)) {
                        Text("Log In")
                            .font(.caption)
                            .foregroundColor(.orange)
                            .underline()
                    }
                }
                .padding(.horizontal)
                
                Spacer()
                
                
            }
            .padding()
        }
    }
}


struct ForgotPasswordView: View {
    var body: some View {
        Text("Forgot Password")
            .font(.title)
            .fontWeight(.bold)
            .foregroundColor(.orange)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
