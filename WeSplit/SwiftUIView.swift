//
//  SwiftUIView.swift
//  WeSplit
//
//  Created by APPLE on 11/04/24.
//

import SwiftUI

struct SwiftUIView: View {
    @State private var inputTemp = "Fahrenheit"
    @State private var outputTemp = "Fahrenheit"
    @State private var amount = 0.0
    @State private var result = 0.0
    @FocusState private var amountIsFocused:Bool
    let temparature = ["Fahrenheit","Celsius","Kelvin"]
    var finalResult:Double{
        if inputTemp == outputTemp{
            return amount
        }else if inputTemp == "Fahrenheit" && outputTemp == "Celsius"{
            return (amount - 32) * 5/9
        }else if inputTemp == "Fahrenheit" && outputTemp == "Kelvin"{
            return (amount - 32) * 5/9 + 273.15
        }else if inputTemp == "Celsius" && outputTemp == "Fahrenheit"{
            return (9/5 * amount) + 32
        }else if inputTemp == "Celsius" && outputTemp == "Kelvin"{
            return amount + 273.15
        }else if inputTemp == "Kelvin" && outputTemp == "Fahrenheit"{
            return (amount - 273.15) * 1.8 + 32.0
        }else if inputTemp == "Kelvin" && outputTemp == "Celsius"{
            return amount - 273.15
        }
        return 0.0
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Input Unit"){
                    Picker("Select the Input temparature",selection: $inputTemp){
                        ForEach(temparature,id:\.self){
                            Text("\($0)")
                        }
                        
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Unit"){
                    Picker("Select the convert temparature",selection: $outputTemp){
                        ForEach(temparature,id:\.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Amount"){
                    TextField("Enter the temparature",value: $amount,format: .number)
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                }
            
                Section("Result"){
                    Text(finalResult,format: .number)
                }
            }
            .navigationTitle("Unit Converson")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                if amountIsFocused{
                    Button("Done"){
                        amountIsFocused = false
                    }
                }
                
            }
        }
        
    }
        
}

#Preview {
    SwiftUIView()
}
