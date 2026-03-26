//
//  signupView.swift
//  Wire
//
//  Created by kartikay on 23/03/26.
//

import SwiftUI

struct signupView: View {
    @Binding var showsignup: Bool
    
    @State private var email: String = ""
    @State private var phoneNumber = ""
    @State private var password = ""
    
    @ObservedObject var viewModel: AuthViewModel
    
    @State private var showConfirmAlert = false

    var body: some View {
            VStack {
                HStack {
                    Text("Signup \nto Wire")
                        .font(Font.custom("Stolzl-Regular", size: 60))
                        .padding(.leading, 110)
                    
                    Spacer()
                }
                
                VStack {
                    TextBox(text: $phoneNumber,type: .phone)
                    TextBox(text: $email,type: .email)
                    TextBox(text: $password,type: .password)
                }
                
                Button(action: {
                    Task {
                        await viewModel.signUp(email: email, phoneNumber: phoneNumber, password: password)
                        
                        if viewModel.errorMessage == nil {
                            showConfirmAlert = true
                        }
                    }
                }) {
                    Group {
                        if viewModel.loading {
                            ProgressView()
                        } else {
                            Text("Sigup")
                        }
                    }
                    .frame(width: 350, height: 55)
                    .background(Color.yellow)
                    .foregroundStyle(.black)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 1)
                    )
                }
                
                HStack {
                    Text("Already have a account?")
                    Button("Signin") {
                        showsignup.toggle()
                    }
                }.padding(.top, 12)
                
            }
            .padding()
            .padding(.bottom, 200)
            .safeAreaPadding(.top)
            .alert("Confirm your Email", isPresented: $showConfirmAlert) {
                Button("Open Mail App") {
                    if let url = URL(string: "message://") {
                        UIApplication.shared.open(url)
                    }
                }
                Button("OK", role: .cancel) {
                    showsignup = false
                }
            } message: {
                Text("We've sent a link to \(email). Please check your inbox!")
            }

        }
}
