//
//  HomeRootView.swift
//  Wire
//
//  Created by kartikay on 26/03/26.
//

import SwiftData
import SwiftUI

struct HomeRootView: View {
    //    @ObservedObject var viewModel: AuthViewModel
    
    @Query private var storedContacts: [ContactModel]
    @StateObject private var contactsUtils = ContactsUtil()
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button(action: {
                        
                    }) {
                        Image(systemName: "person.circle")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                    
                    Spacer()
                    
                    Text("Chat")
                        .font(Font.custom("Stolzl-Regular", size: 30))
                        .foregroundColor(.primary)
                    
                    Spacer()
                    
                    Button(action: {
                        
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.primary)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.top, 20)
                
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .background(
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
                                        .init(color: Color("BgColor"), location: 0.25),
                                        .init(color: Color("BgColor"), location: 0.4),
                                        .init(color: Color("BgColor"), location: 1.0),
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            ).ignoresSafeArea()
                    }
                )
            
            if storedContacts.isEmpty == true {
                ZStack {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    GetContactView(contactsUtils: contactsUtils)
                }
                
            }
            
        }
    }
}

#Preview {
    HomeRootView()
}
