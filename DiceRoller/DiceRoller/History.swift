//
//  History.swift
//  DiceRoller
//
//  Created by Ruslan Alekyan on 03.06.2023.
//

import SwiftUI

class History: ObservableObject {
    @Published var history: [[Int]] {
        didSet {
            save()
        }
    }
    
    private var historyKey = "History"
    
    init() {
        if let savedHistory = UserDefaults.standard.array(forKey: historyKey) as? [[Int]] {
            history = savedHistory
        } else {
            history = []
        }
    }
    
    private func save() {
        UserDefaults.standard.set(history, forKey: historyKey)
    }
}
