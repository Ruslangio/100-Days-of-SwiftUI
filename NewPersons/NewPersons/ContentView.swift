//
//  ContentView.swift
//  NewPersons
//
//  Created by Ruslan Alekyan on 30.04.2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @State private var showingAddPerson = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.persons) { person in
                    NavigationLink {
                        PersonView(person: person)
                    } label: {
                        HStack {
                            Image(uiImage: UIImage(data: person.image)!)
                                .resizable()
                                .scaledToFit()
                                .frame(maxHeight: 80)
                            Text(person.name)
                                .font(.title)
                        }
                    }
                }
                .onDelete { viewModel.persons.remove(atOffsets: $0) }
            }
            .navigationTitle("NewPersons")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddPerson = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddPerson) {
                AddPersonView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
