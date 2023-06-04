//
//  Person.swift
//  NewPersons
//
//  Created by Ruslan Alekyan on 30.04.2023.
//

import CoreLocation
import Foundation

struct Person: Identifiable, Codable {
    var id = UUID()
    let name: String
    let latitude: Double
    let longitude: Double
    let image: Data
}
