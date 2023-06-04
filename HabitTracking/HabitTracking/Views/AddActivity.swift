//
//  AddActivity.swift
//  HabitTracking
//
//  Created by Ruslan Alekyan on 20.09.2022.
//

import SwiftUI

struct AddActivity: View {
    @ObservedObject var habits: Habits
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var description = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
                
            }
            .navigationTitle("Add Activity")
            .toolbar {
                Button("Save") {
                    habits.habits.append(Activity(name: name, description: description))
                    dismiss()
                }
            }
        }
    }
}

struct AddActivity_Previews: PreviewProvider {
    static var previews: some View {
        AddActivity(habits: Habits())
    }
}
