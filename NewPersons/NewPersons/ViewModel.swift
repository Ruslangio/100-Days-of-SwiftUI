//
//  ViewModel.swift
//  NewPersons
//
//  Created by Ruslan Alekyan on 30.04.2023.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var persons = [Person]() {
        didSet {
            if let encodedData = try? JSONEncoder().encode(persons) {
                UserDefaults.standard.set(encodedData, forKey: "Persons")
            }
        }
    }
    
    init() {
        loadData()
    }
    
    func loadData() {
        if let savedData = UserDefaults.standard.data(forKey: "Persons") {
            let decodedData = try? JSONDecoder().decode([Person].self, from: savedData)
            persons = decodedData ?? []
        }
    }
    
    // MARK: - Intent(s)
    
    func addPerson(_ person: Person) {
        if let index = persons.firstIndex(where: { $0.name > person.name }) {
            persons.insert(person, at: index)
        } else {
            persons.append(person)
        }
    }
}
