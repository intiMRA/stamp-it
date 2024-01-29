//
//  stamp_itApp.swift
//  stamp it
//
//  Created by ialbuquerque on 15/01/24.
//

import SwiftUI

@main
struct stamp_itApp: App {
    @StateObject var stack = Router()
    @StateObject var store = Store.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $stack.stack) {
                NavigationView {
                    ContentView()
                        .environmentObject(stack)
                }
            }
        }
    }
}
