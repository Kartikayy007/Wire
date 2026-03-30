//
//  AuthViewModel.swift
//  Wire
//
//  Created by kartikay on 26/03/26.
//

import Combine
import Foundation
import Supabase

@MainActor
class AuthViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var loading = false
    @Published var errorMessage: String?
    
    init() {
        Task {
            self.currentUser = try? await SupabaseService.client.auth.session.user
        }
    }
    
    func signIn(email: String, password: String) async {
        loading = true  
        errorMessage = nil
        
        do {
            try await SupabaseService.client.auth.signIn(email: email, password: password)
            self.currentUser = try await SupabaseService.client.auth.session.user
            
            } catch {
            errorMessage = error.localizedDescription
        }
        
        loading = false
    }
    
    func signUp(email: String, phoneNumber: String, password: String) async {
        loading = true
        errorMessage = nil
        
        do {
            try await SupabaseService.client.auth.signUp(
                email: email,
                password: password,
                data: ["phone": AnyJSON.string(phoneNumber)]
            )

        } catch {
            errorMessage = error.localizedDescription
        }
        
        loading = false
    }
    
    func signOut() async {
        loading = true
        errorMessage = nil
        
        do {
            try await SupabaseService.client.auth.signOut()
            self.currentUser = nil
        } catch {
            errorMessage = error.localizedDescription
        }
        
        loading = false
    }
}


