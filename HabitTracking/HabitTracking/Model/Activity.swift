//
//  Activity.swift
//  HabitTracking
//
//  Created by Ruslan Alekyan on 20.09.2022.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var name: String
    var description: String
    var activityCount = 0
}
