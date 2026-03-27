//
//  WireApp.swift
//  Wire
//
//  Created by kartikay on 23/03/26.
//

import SwiftUI
import SwiftData

@main
struct WireApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: ContactModel.self)
    }
}
