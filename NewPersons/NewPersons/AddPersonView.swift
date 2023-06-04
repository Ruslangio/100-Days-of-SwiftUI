//
//  AddPersonView.swift
//  NewPersons
//
//  Created by Ruslan Alekyan on 30.04.2023.
//

import CoreLocation
import SwiftUI

struct AddPersonView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var location: CLLocationCoordinate2D?
    @State private var image: Image?
    
    @State private var inputImage: UIImage?
    @State private var showingImagePicker = true
    
    let locationFetcher = LocationFetcher()

    var body: some View {
        NavigationView {
            Form {
                Section("Name") {
                    TextField("Name", text: $name)
                }
                
                Section("Where did you meet?") {
                    if location == nil {
                        Button("Add current location") {
                            locationFetcher.start()
                            location = locationFetcher.lastKnownLocation
                        }
                    } else {
                        Text("Location saved")
                    }
                }
                
                Section("Image") {
                    Button("Select image") {
                        showingImagePicker.toggle()
                    }
                    
                    image?
                        .resizable()
                        .scaledToFit()
                }
            }
            .navigationTitle("Add person")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Add") {
                        addPerson()
                    }
                    .disabled(name == "" || location == nil || image == nil)
                }
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: $inputImage)
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func addPerson() {
        if let jpegData = inputImage?.jpegData(compressionQuality: 0.8) {
            if let location {
                viewModel.addPerson(Person(name: name, latitude: location.latitude, longitude: location.longitude, image: jpegData))
            }
        }
        dismiss()
    }
}

struct AddPersonView_Previews: PreviewProvider {
    static var previews: some View {
        AddPersonView()
    }
}
