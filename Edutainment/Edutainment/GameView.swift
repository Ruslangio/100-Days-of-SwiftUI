//
//  GameView.swift
//  Edutainment
//
//  Created by Ruslan Alekyan on 17.08.2022.
//

import SwiftUI

struct GameView: View {
    let number: Int
    let numberOfQuestions: Int
    var questions: [Question] = []
    mutating func getQuestions(numberOfQuestions: Int) {
        for _ in 1...numberOfQuestions {
            let randomNumber = Int.random(in: 1...12)
            questions.append(Question(text: "\(number) * \(randomNumber)", answer: number * randomNumber))
        }
    }

    @State private var score = 0
    @State private var answer = ""
    @State private var completeQuestions = 0
    
    var body: some View {
        VStack {
            Text("Score: \(score)")
            
            Text("")
            
            TextField("Enter answer", text: $answer)
            
            Button("Enter") {
                if completeQuestions == numberOfQuestions {
                    
                } else {
                    
                }
            }
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(number: 0, numberOfQuestions: 0)
    }
}
