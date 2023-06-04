//
//  EditActivity.swift
//  HabitTracking
//
//  Created by Ruslan Alekyan on 20.09.2022.
//

import SwiftUI

struct EditActivity: View {
    @ObservedObject var habits: Habits
    @State var activity: Activity
    
    var body: some View {
        VStack {
            Text(activity.description)
            Text("Activity Count: \(activity.activityCount)")
            Button("Increase") {
                let index = habits.habits.firstIndex(of: activity)
                var habit = activity
                habit.activityCount += 1
                habits.habits[index!] = habit
                activity = habit
            }
        }
        .navigationTitle(activity.name)
    }
}

struct EditActivity_Previews: PreviewProvider {
    static var previews: some View {
        EditActivity(habits: Habits(), activity: Activity(name: "Some", description: "Something"))
    }
}
