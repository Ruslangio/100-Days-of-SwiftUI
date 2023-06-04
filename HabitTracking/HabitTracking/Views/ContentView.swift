//
//  ContentView.swift
//  HabitTracking
//
//  Created by Ruslan Alekyan on 20.09.2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var habits: Habits
    @State private var showingAddActivity = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(habits.habits) { habit in
                    NavigationLink(destination: EditActivity(habits: habits, activity: habit)) {
                        VStack(alignment: .leading, spacing: 2) {
                            Text(habit.name)
                            HStack {
                                Text(habit.description)
                                Spacer()
                                Text(String(habit.activityCount))
                            }
                            .font(.subheadline)
                            .foregroundColor(.secondary)
                        }
                    }
                }
                .onDelete(perform: removeHabits)
            }
            .navigationTitle("Habit Tracking")
            .toolbar {
                Button {
                    showingAddActivity = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddActivity) {
                AddActivity(habits: habits)
            }
        }
    }
    
    func removeHabits(at offsets: IndexSet) {
        habits.habits.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(habits: Habits())
    }
}
