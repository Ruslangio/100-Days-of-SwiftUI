//
//  DiceRollerApp.swift
//  DiceRoller
//
//  Created by Ruslan Alekyan on 30.05.2023.
//

import SwiftUI

@main
struct DiceRollerApp: App {
    @StateObject var settings = Settings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
        }
    }
}
