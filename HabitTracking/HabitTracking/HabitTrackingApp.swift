//
//  HabitTrackingApp.swift
//  HabitTracking
//
//  Created by Ruslan Alekyan on 20.09.2022.
//

import SwiftUI

@main
struct HabitTrackingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(habits: Habits())
        }
    }
}
