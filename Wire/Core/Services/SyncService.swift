//
//  SyncService.swift
//  Wire
//
//  Created by kartikay on 29/03/26.
//

import Foundation
import Combine
import Supabase

class SyncService {
    static let shared = SyncService()
    
    private init() {}
    
    @Published var registeredPhones: [String] = []
    @Published var error: String?
    @Published var loading = false
    
    func lookupUsers(phones: [String]) async throws -> [String] {
        guard !phones.isEmpty else {
            print("phone numbers are empty")
            return []
        }

        loading = true
        error = nil

        let urlString = "\(AppConfig.baseURL)/users/lookup"
        guard let url = URL(string: urlString) else {
            print("Invalid URL formed: \(urlString)")
            return []
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "content-Type")

        if let session = try? await SupabaseService.client.auth.session {
            request.setValue("Bearer \(session.accessToken)", forHTTPHeaderField: "Authorization")
        }

        let body: [String: [String]] = ["phones": phones]
        request.httpBody = try? JSONEncoder().encode(body)

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodeResponse = try JSONDecoder().decode(UserLookupResponse.self, from: data)

            self.registeredPhones = decodeResponse.registered
        } catch {
            self.error = "sync failed \(error.localizedDescription)"
        }

        loading = false
        
        print("these are phones\(registeredPhones)")
        
        return registeredPhones
    }
}
    
