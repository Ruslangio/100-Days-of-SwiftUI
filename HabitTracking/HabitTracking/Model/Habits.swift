//
//  Habits.swift
//  HabitTracking
//
//  Created by Ruslan Alekyan on 20.09.2022.
//

import Foundation

class Habits: ObservableObject {
    @Published var habits: [Activity] = [] {
        didSet {
            if let encoded = try? JSONEncoder().encode(habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }
    
    init() {
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits") {
            if let decodedHabits = try? JSONDecoder().decode([Activity].self, from: savedHabits) {
                habits = decodedHabits
                return
            }
        }
        
        habits = []
    }
}
