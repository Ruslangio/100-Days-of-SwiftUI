//
//  DetailView.swift
//  Friendface
//
//  Created by Ruslan Alekyan on 29.05.2023.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        Form {
            Section("Personal information") {
                HStack {
                    Text("Name").bold()
                    Spacer()
                    Text(user.name)
                }
                HStack {
                    Text("Age").bold()
                    Spacer()
                    Text(user.age, format: .number)
                }
                HStack {
                    Text("Company").bold()
                    Spacer()
                    Text(user.company)
                }
                HStack {
                    Text("Email").bold()
                    Spacer()
                    Text(user.address)
                }
                HStack {
                    Text("Address").bold()
                    Spacer()
                    Text(user.email)
                }
                HStack {
                    Text("Registred").bold()
                    Spacer()
                    Text(user.registered, style: .date)
                }
                VStack(alignment: .leading) {
                    Text("About").bold()
                    Text(user.about)
                }
                VStack(alignment: .leading) {
                    Text("Tags").bold()
                    List(user.tags, id: \.self) { tag in
                        Text(tag)
                    }
                }
            }
            
            Section("Friends") {
                List(user.friends) { friend in
                    Text(friend.name)
                }
            }
        }
        .navigationTitle(user.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView()
//    }
//}
