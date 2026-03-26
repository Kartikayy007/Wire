//
//  HomeRootView.swift
//  Wire
//
//  Created by kartikay on 26/03/26.
//

import SwiftUI

struct HomeRootView: View {
//    @ObservedObject var viewModel: AuthViewModel
    
    var body: some View {
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
        }
    }
}

#Preview {
    HomeRootView()
}
