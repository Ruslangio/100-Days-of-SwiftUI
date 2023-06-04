//
//  SettingsView.swift
//  DiceRoller
//
//  Created by Ruslan Alekyan on 31.05.2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings: Settings
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Number of dices") {                                                                                    // Doesn't work
                    Stepper("Number of dices: \(settings.numberOfDices)", value: $settings.numberOfDices, in: 2...6)
                }
                
                Section("Type of dices") {
                    Stepper("Sides on a dice: \(settings.typeOfDices)", value: $settings.typeOfDices, in: 4...100)
                }
            }
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Button("Close") {
                    dismiss()
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
