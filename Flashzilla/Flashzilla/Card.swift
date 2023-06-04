//
//  Card.swift
//  Flashzilla
//
//  Created by Ruslan Alekyan on 21.05.2023.
//

import Foundation

struct Card: Codable {
    let prompt: String
    let answer: String
    
    static let example = Card(prompt: "Who played the 13th Doctor in Doctor Who?", answer: "Jodie Whittaker")
}
