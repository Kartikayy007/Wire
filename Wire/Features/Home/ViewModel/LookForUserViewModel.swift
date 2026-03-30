//
//  LookForUserViewModel.swift
//  Wire
//
//  Created by kartikay on 28/03/26.
//

import Combine
import Foundation
import Supabase
import SwiftData

@MainActor
class LookForUserViewModel: ObservableObject {
    
    @Published var registeredPhones: [String] = []
    @Published var error: String?
    @Published var loading = false
    
    func syncContacts(_ contacts: [ContactModel]) async {
        let cleanPhones = contacts.flatMap { contact in
            contact.phoneNumbers.map { phone in
                let clean = phone.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
                return clean.count >= 10 ? String(clean.suffix(10)) : clean
            }
        }
        print("cleanphones: \(cleanPhones)")
        
        guard !cleanPhones.isEmpty else {
            return
        }
        
        loading = true
        error = nil
        
        do {
            let result = try await SyncService.shared.lookupUsers(phones: cleanPhones)
            
            self.registeredPhones = result
        } catch {
            self.error = error.localizedDescription
        }
        
        loading = false
    }
}
