//
//  TextBox.swift
//  Wire
//
//  Created by kartikay on 23/03/26.
//

import SwiftUI

struct TextBox: View {
    @Binding var text: String
    var type: TextBoxtype
    
    var placeholder: String {
        switch type {
            case .phone: return "Enter you phone number"
            case .password: return "Enter your password"
            case .email: return "Enter your mail"
        }
    }
    
    var body: some View {
        Group {
            if type == .password {
                SecureField(placeholder, text: $text)
            } else if type == .phone {
                TextField(placeholder, text: $text)
                    .keyboardType(.numberPad)
            }
            else {
                TextField(placeholder, text: $text)
            }
        }
            .padding(20)
            .frame(width: 350)
            .background(Color.clear)
            .cornerRadius(30)
            .overlay(
                RoundedRectangle(cornerRadius: 30)
                    .stroke(Color.black, lineWidth: 1)
            )
            .padding(.horizontal, 20)
    }
}

enum TextBoxtype {
    case password
    case phone
    case email
}
