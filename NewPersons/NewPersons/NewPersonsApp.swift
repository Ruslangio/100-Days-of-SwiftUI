//
//  NewPersonsApp.swift
//  NewPersons
//
//  Created by Ruslan Alekyan on 30.04.2023.
//

import SwiftUI

@main
struct NewPersonsApp: App {
    @StateObject private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
