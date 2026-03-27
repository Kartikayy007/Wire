//
//  AuthRootView.swift
//  Wire
//
//  Created by kartikay on 23/03/26.
//

import SwiftUI
import Supabase

struct AuthRootView: View {
    @State private var showsignup = false
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        Group {
            if viewModel.currentUser != nil {
//                HomeRootView(viewModel: viewModel)
                HomeRootView()
            } else {
                ZStack {
                    Image("grid")
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                    
                    Color("BgColor").opacity(0.5)
                    
                    Rectangle()
                        .fill(
                            LinearGradient(
                                stops: [
                                    .init(color: .clear, location: 0.0),
                                    .init(color: .clear, location: 0.01),
                                    .init(color: Color("BgColor"), location: 0.4),
                                    .init(color: Color("BgColor"), location: 1.0)
                                ],
                                startPoint: .top,
                                endPoint: .bottom
                            )
                        ).ignoresSafeArea()
                    
                    if showsignup {
                        signupView(showsignup: $showsignup, viewModel: viewModel)
                    } else {
                        LoginView(showsignup: $showsignup, viewModel: viewModel)
                    }
                }
            }
        }.onOpenURL { url in
            Task {
                do {
                    try await supabase.auth.session(from: url)
                } catch {
                    print("Deep link error: \(error)")
                }
            }
        }
    }
}

#Preview {
    AuthRootView()
}

