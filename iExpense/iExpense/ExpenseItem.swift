//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Ruslan Alekyan on 14.08.2022.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
