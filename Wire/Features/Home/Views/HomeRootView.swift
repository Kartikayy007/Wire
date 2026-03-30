//
//  HomeRootView.swift
//  Wire
//
//  Created by kartikay on 26/03/26.
//

import SwiftData
import SwiftUI

struct HomeRootView: View {
    @ObservedObject var viewModel: AuthViewModel
    @StateObject private var lookupViewModel = LookForUserViewModel()
    
    @State var search: String
    
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
                    
//                    Button(action: {
//                        Task {
//                            await viewModel.signOut()
//                        }
//                    }) {
//                        Text("signout")
//                            .padding()
//                            .background(Color.red.opacity(0.1))
//                            .cornerRadius(10)
//                    }
//                    .padding(.top, 50)
                    
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


                HStack {
                    TextField("Search", text: $search)
                        .padding(32)
                    
                    Button(action: {}) {
                        Circle()
                            .padding(10)
                            .overlay(
                                Image(systemName: "arrowshape.right")
                                    .foregroundStyle(.white)
                            )
                    }
                    
                }.frame(maxWidth: 350, maxHeight: 55)
                    .background(Color.yellow)
                    .foregroundStyle(.black)
                    .cornerRadius(30)
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.vertical, 15)
                
                VStack {
                    ChatsListView(
                        storedContacts: storedContacts,
                        registeredPhones: lookupViewModel.registeredPhones)
                }.refreshable(action: {
                    print("refresing and calling API")
                    await lookupViewModel.syncContacts(storedContacts)
                })
                
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
            
            if storedContacts.isEmpty {
                ZStack {
                    Color.black.opacity(0.4).ignoresSafeArea()
                    GetContactView(contactsUtils: contactsUtils)
                }
                
            }
            
        }.task(id: storedContacts.count) {
            await lookupViewModel.syncContacts(storedContacts)
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    HomeRootView(viewModel: AuthViewModel(), search: "seach")
}
