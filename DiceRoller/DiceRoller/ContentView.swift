//
//  ContentView.swift
//  DiceRoller
//
//  Created by Ruslan Alekyan on 30.05.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: Settings
    @StateObject var historyViewModel = History()
    
    @State private var diceNumbers = [Int]()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Total - \(diceNumbers.reduce(0, +))")
                    .font(.title)
                dices
                history
            }
            .navigationTitle("Dice Roller")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    settingsButton
                }
                ToolbarItem {
                    rollButton
                }
                ToolbarItem(placement: .bottomBar) {
                    clearHistoryButton
                }
            }
        }
    }
    
    private var dices: some View {
        HStack {
            ForEach(diceNumbers, id: \.self) { number in
                DiceView(number: number)
            }
        }
    }
    
    private var history: some View {
        ScrollView {
            ForEach(historyViewModel.history.reversed(), id: \.self) { roll in
                let text = roll.map(String.init).joined(separator: ", ")
                Text(text)
            }
        }
    }
    
    // MARK: - Toolbar Buttons
    
    @State private var isShowingSettings = false
    
    private var settingsButton: some View {
            Button {
                isShowingSettings = true
            } label: {
                Image(systemName: "gear")
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView()
            }
    }
    
    private var rollButton: some View {
        Button("Roll") {
            diceNumbers = []
            for _ in 0..<settings.numberOfDices {
                diceNumbers.append(Int.random(in: 1...settings.typeOfDices))
            }
            historyViewModel.history.append(diceNumbers)
        }
    }
    
    private var clearHistoryButton: some View {
        Button("Clear") {
            historyViewModel.history = []
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
