//
//  ContentView.swift
//  UnitConversions
//
//  Created by Ruslan Alekyan on 08.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0.0
    @State private var inputUnit = ""
    @State private var outputUnit = ""
    @FocusState private var amountIsFocused: Bool
    
    var units = ["Celsius", "Fahrenheit", "Kelvin", "meters", "kilometers", "feet", "yards", "miles", "seconds", "minutes", "hours", "days", "milliliters", "liters", "cups", "pints", "gallons"]
    
    var outputNumber: Double {
        var minNumber: Double {
            switch inputUnit {
            case "Celsius": return inputNumber * 1.8 + 32
            case "Fahrenheit": return inputNumber
            case "Kelvin": return inputNumber * 1.8 - 459.67
                
            case "meters": return inputNumber * 3.281
            case "kilometers": return inputNumber * 3281
            case "feet": return inputNumber
            case "yards": return inputNumber * 3
            case "miles": return inputNumber * 5280
                
            case "seconds": return inputNumber
            case "minutes": return inputNumber * 60
            case "hours": return inputNumber * 3600
            case "days": return inputNumber * 86400
                
            case "milliliters": return inputNumber
            case "liters": return inputNumber * 1000
            case "cups": return inputNumber * 240
            case "pints": return inputNumber * 473.2
            case "gallons": return inputNumber * 3785
                
            default: return 0
            }
        }
        
        switch outputUnit {
        case "Celsius": return (minNumber - 32) / 1.8
        case "Fahrenheit": return minNumber
        case "Kelvin": return (minNumber + 459.67) / 1.8
            
        case "meters": return minNumber / 3.281
        case "kilometers": return minNumber / 3281
        case "feet": return minNumber
        case "yards": return minNumber / 3
        case "miles": return minNumber / 5280
            
        case "seconds": return minNumber
        case "minutes": return minNumber / 60
        case "hours": return minNumber / 3600
        case "days": return minNumber / 86400
            
        case "milliliters": return minNumber
        case "liters": return minNumber / 1000
        case "cups": return minNumber / 240
        case "pints": return minNumber / 473.2
        case "gallons": return minNumber / 3785
            
        default: return 0
        }
        
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("", value: $inputNumber, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                    
                    Picker("Choose input unit", selection: $inputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                    
                    Picker("Choose output unit", selection: $outputUnit) {
                        ForEach(units, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section {
                    Text(outputNumber, format: .number)
                }
            }
            .navigationTitle("UnitConversions")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
