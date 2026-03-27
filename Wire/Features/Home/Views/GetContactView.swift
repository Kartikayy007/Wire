//
//  GetContactView.swift
//  Wire
//
//  Created by kartikay on 27/03/26.
//

import SwiftUI

struct GetContactView: View {
    let contactsUtils: ContactsUtil
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        Rectangle()
            .frame(width: 360, height: 350)
            .foregroundStyle(Color(hex: 0xF0B4D4))
            .cornerRadius(22)
            .overlay(
                VStack() {
                    Text("Please share your contacts to Find Friends on Wire")
                        .font(Font.custom("Stolzl-regular", size: 30))
                    
                    Spacer()
                    
                    Button(action: {
                        contactsUtils.reqAccess { granted in
                            if granted {
                                DispatchQueue.main.async {
                                    contactsUtils.fetchContacts(context: modelContext)
                                }
                                print("something")
                            } else {
                                print("access denied")  
                            }
                        }
                        
                    }) {
                        Text("Share contacts")
                            .font(Font.custom("stolzl-regular", size: 20))
                    }.frame(width: 300, height: 55)
                        .background(Color.white)
                        .foregroundStyle(.black)
                        .cornerRadius(30)
                        .overlay(
                            RoundedRectangle(cornerRadius: 30)
                                .stroke(Color.black, lineWidth: 1)
                        )
                    
                }.padding(.vertical, 45)
            )
            .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

#Preview {
    GetContactView(contactsUtils: ContactsUtil())
}
