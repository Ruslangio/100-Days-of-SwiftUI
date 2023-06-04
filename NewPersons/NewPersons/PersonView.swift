//
//  PersonView.swift
//  NewPersons
//
//  Created by Ruslan Alekyan on 30.04.2023.
//

import MapKit
import SwiftUI

struct PersonView: View {
    @EnvironmentObject var viewModel: ViewModel

    var person: Person
        
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43, longitude: 40), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
    
    var body: some View {
        VStack {
            Image(uiImage: UIImage(data: person.image)!)
                .resizable()
                .scaledToFit()
            Map(coordinateRegion: $mapRegion, annotationItems: viewModel.persons) { person in
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: person.latitude, longitude: person.longitude)) {
                    VStack {
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 44, height: 44)
                            .background(.white)
                            .clipShape(Circle())
                    }
                    
                }
            }
        }
        .navigationTitle(person.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

//struct PersonView_Previews: PreviewProvider {
//    static var previews: some View {
//        PersonView()
//    }
//}
