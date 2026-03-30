//
//  SupabaseService.swift
//  Wire
//
//  Created by kartikay on 24/03/26.
//

import Supabase
import Foundation

enum SupabaseService {
    static let client = SupabaseClient(
        supabaseURL: URL(string: AppConfig.supabaseURL)!,
        supabaseKey: AppConfig.supabaseKey
    )
}
