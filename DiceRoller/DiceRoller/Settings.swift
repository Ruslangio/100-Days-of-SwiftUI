//
//  Settings.swift
//  DiceRoller
//
//  Created by Ruslan Alekyan on 31.05.2023.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var numberOfDices = 2
    @Published var typeOfDices = 6
}
