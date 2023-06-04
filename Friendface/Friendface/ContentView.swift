//
//  ContentView.swift
//  Friendface
//
//  Created by Ruslan Alekyan on 24.10.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: DetailView(user: user)) {
                    HStack {
                        Image(systemName: "circle.fill")
                            .foregroundColor(user.isActive ? .green : .red)
                        Text(user.name)
                    }
                }
            }
            .onAppear(perform: loadData)
            .navigationTitle("Friendface")
        }
    }
    
    private func loadData() {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else { return }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let data {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                if let decodedUsers = try? decoder.decode([User].self, from: data) {
                    users = decodedUsers
                }
            }
        }
        .resume()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
