//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Ruslan Alekyan on 09.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var currentChoiceOfApp = Int.random(in: 0...2)
    @State private var shouldWin = Bool.random()
    @State private var score = 0
    @State private var completedAnswers = 0
    @State private var showAlert = false
    
    var moves = ["Paper", "Rock", "Scissors"]
    
    var rightChoice: String {
        switch moves[currentChoiceOfApp] {
        case "Paper":
            return shouldWin ? "Scissors" : "Rock"
        case "Rock":
            return shouldWin ? "Paper" : "Scissors"
        default:
            return shouldWin ? "Rock" : "Paper"
        }
    }
    
    var body: some View {
        Spacer()
        
        VStack {
            Text(score, format: .number)
            Text(moves[currentChoiceOfApp])
            Text(shouldWin ? "Player should win" : "Player should lose")
        }
        .font(.largeTitle)
        
        Spacer()
        Spacer()
        
        HStack {
            ForEach(moves, id: \.self) { thing in
                Button(thing) {
                    if rightChoice == thing {
                        score += 1
                    } else {
                        score -= 1
                    }
                    completedAnswers += 1
                    currentChoiceOfApp = Int.random(in: 0...2)
                    shouldWin = Bool.random()
                    if completedAnswers == 10 {
                        showAlert = true
                    }
                }
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding()
                .background(.red)
            }
        }
        .alert("Your score is \(score)", isPresented: $showAlert) {
            Button("Continue") {
                score = 0
                completedAnswers = 0
                currentChoiceOfApp = Int.random(in: 0...2)
                shouldWin = Bool.random()
            }
        }
        
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
