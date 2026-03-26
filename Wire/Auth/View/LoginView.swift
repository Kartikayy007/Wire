//
//  LoginView.swift
//  Wire
//
//  Created by kartikay on 23/03/26.
//

import SwiftUI

struct LoginView: View {
    @Binding var showsignup: Bool
    
    @State private var email = ""
    @State private var password = ""
    
    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text("Signin \nto Wire")
                    .font(Font.custom("Stolzl-Regular", size: 60))
                    .padding(.leading, 110)
                
                Spacer()
            }
            
            VStack {
                TextBox(text: $email,type: .email)
                TextBox(text: $password,type: .password)
            }
            
            Button(action: {
                Task {
                    await viewModel.signIn(email: email, password: password)
                }
            }) {
                Group {
                    if viewModel.loading {
                        ProgressView()
                    } else {
                        Text("Login")
                    }
                }.frame(width: 350, height: 55)
                    .background(Color.yellow)
                    .foregroundStyle(.black)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 1)
                    )
            }
            
            HStack {
                Text("Don't have a account?")
                Button("Signup") {
                    showsignup.toggle()
                }
            }.padding(.top, 12)
            
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
                    .padding(.top, 10)
            }
            
        }
        .padding()
        .padding(.bottom, 200)
        .safeAreaPadding(.top)
    }
}


