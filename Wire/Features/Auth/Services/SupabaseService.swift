//
//  SupabaseService.swift
//  Wire
//
//  Created by kartikay on 24/03/26.
//

import Supabase
import Foundation

let supabase = SupabaseClient(
    supabaseURL: URL(string: "https://bmqikkzpgaxkmurizjbd.supabase.co")!,
    supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJtcWlra3pwZ2F4a211cml6amJkIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzQyNzY5MTgsImV4cCI6MjA4OTg1MjkxOH0.goqKWa58eFyNGSQwEhaDj3wYqbrwtXiqahcZ-TK70Hg")
