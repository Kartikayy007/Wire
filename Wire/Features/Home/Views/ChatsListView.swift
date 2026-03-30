//
//  ChatsListView.swift
//  Wire
//
//  Created by kartikay on 27/03/26.
//

import SwiftUI
import SwiftData

struct ChatsListView: View {
    var storedContacts: [ContactModel]
    var registeredPhones: [String]
    
    var wireContacts: [ContactModel] {
        storedContacts.filter { contact in
            contact.phoneNumbers.contains { phone in
                let cleanPhone = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                let last10 = String(cleanPhone.suffix(10))
                
                return registeredPhones.contains(last10)
            }
        }
    }
    
    
    var body: some View {
        ScrollView {
            LazyVStack {
                if wireContacts.isEmpty {
                    Text("No contacts on Wire yet. Invite them!")
                        .font(Font.custom("Stolzl-regular", size: 16))
                        .foregroundColor(.gray)
                        .padding(.top, 50)
                } else {
                    ForEach(wireContacts, id: \.id) { contact in
                        HStack {
                            Image(systemName: "person.circle")
                                .font(.system(size: 40))
                            
                            VStack(alignment: .leading) {
                                Text("\(contact.givenName) \(contact.familyName)")
                                    .font(Font.custom("Stolzl-Bold", size: 20))
                                Text("Hey, he is on Wire! Message him.")
                                    .font(Font.custom("Stolzl-regular", size: 15))
                                    .lineLimit(1)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .trailing) {
                                Text("Now")
                                    .font(Font.custom("Stolzl-regular", size: 15))
                                    .foregroundColor(.gray)
                                Circle()
                                    .frame(width: 20)
                                    .foregroundStyle(.green)
                                    .overlay(
                                        Text("1")
                                            .font(.caption)
                                            .fontDesign(.rounded)
                                            .foregroundColor(.white)
                                    )
                            }
                        }
                        
                        Divider()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.horizontal, 25)
                }
            }
        }
    }
}
