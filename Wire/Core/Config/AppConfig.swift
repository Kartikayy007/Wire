//
//  AppConfig.swift
//  Wire
//
//  Created by kartikay on 30/03/26.
//

import Foundation

enum AppConfig {
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    static let baseURL: String = {
        guard let urlString = AppConfig.infoDictionary["BASE_URL"] as? String, !urlString.isEmpty else {
            fatalError("BASE_URL is empty or missing in Info.plist. Check your .xcconfig linkage.")
        }
        return urlString
    }()
    
    static let supabaseURL: String = {
        guard let urlString = AppConfig.infoDictionary["SUPABASE_URL"] as? String, !urlString.isEmpty else {
            fatalError("SUPABASE_URL is empty or missing in Info.plist. Check your .xcconfig linkage.")
        }
        return urlString
    }()
    
    static let supabaseKey: String = {
        guard let keyString = AppConfig.infoDictionary["SUPABASE_KEY"] as? String else {
            fatalError("SUPABASE_KEY not set in xcconfig/plist")
        }
        return keyString
    }()
}
