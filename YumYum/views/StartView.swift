//
//  ContentView.swift
//  YumYum
//
//  Created by fahad samara on 3/1/24.
//

import SwiftUI


import SwiftUI

struct StartView: View {
    var body: some View {
        NavigationView {
            VStack {
                Image("1")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Welcome to YumYum")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    Text("Discover amazing recipes and restaurants near you!")
                        .font(.headline)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Sign Up")
                            .font(.title2)
                            .foregroundColor(.white)
                            .padding(.vertical, 13)
                            .padding(.horizontal, 90)
                            .background(Color.orange)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink {
                 
                        LoginView().navigationBarBackButtonHidden(true)
                    } label: {
                   
                    
                        HStack {
                            Text("Already have an account?")
                                .font(.caption)
                                .foregroundColor(.white)
                            
                            Text("Log In")
                                .font(.callout)
                                .foregroundColor(.orange)
                                .underline()
                        }
                    }
                }
                .padding()
                .padding(.bottom, 50)
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .background(Color.black.edgesIgnoringSafeArea(.all))
        }
    }
}



#Preview {
    StartView()
}
