//
//  ContentView.swift
//  Edutainment
//
//  Created by Ruslan Alekyan on 17.08.2022.
//

import SwiftUI

struct Question {
    let text: String
    let answer: Int
}

struct ContentView: View {
    @State private var questionNumber = 1
    @State private var number = 2
    @State private var question = 5
    
    var questions: [Question] = []
    
    mutating func getQuestions(numberOfQuestions: Int) {
        for _ in 1...numberOfQuestions {
            let randomNumber = Int.random(in: 1...12)
            questions.append(Question(text: "\(number) * \(randomNumber)", answer: number * randomNumber))
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    Spacer()
                    
                    Stepper("Number:", value: $number, in: 2...12)
                    Text(number, format: .number)
                    
                    Stepper("Questions", value: $question, in: 5...20)
                    Text(question, format: .number)
                    
                    Spacer()
                    Spacer()
                    
                    NavigationLink {
                        getQuestions(numberOfQuestions: question)
                        GameView(number: number, numberOfQuestions: question)
                    } label: {
                        ZStack {
                            Rectangle()
                                .strokeBorder(.red)
                                .frame(width: 155, height: 85)
                            Text("Start Game")
                                .font(.title)
                                .frame(width: 150, height: 80)
                                .background(.green)
                                .foregroundColor(.white)
                        }
                    }
                    
                    Spacer()
                }
                .font(.title2)
                .padding()
            }
            .navigationTitle("Edutainment")
            .background(LinearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
