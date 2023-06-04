//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Ruslan Alekyan on 30.05.2023.
//

import SwiftUI

struct ContentView: View {
    let resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(
                                RoundedRectangle(cornerRadius: 5)
                            )
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            .toolbar {
                Menu {
                    Button("Sort by default") {
                        sorting = .none
                    }
                    Button("Sort by name") {
                        sorting = .name
                    }
                    Button("Sort by country") {
                        sorting = .country
                    }
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }

            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
    }
    
    enum SortOptions {
        case none
        case name
        case country
    }
    
    @State private var sorting = SortOptions.none
    
    var filteredResorts: [Resort] {
        var sortedResorts = resorts
        
        switch sorting {
        case .none: sortedResorts = resorts
        case .name: sortedResorts = resorts.sorted(by: { $0.name < $1.name })
        case .country: sortedResorts = resorts.sorted(by: { $0.country < $1.country })
        }
        
        if searchText.isEmpty {
            return sortedResorts
        } else {
            return sortedResorts.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
