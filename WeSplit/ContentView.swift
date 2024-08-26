//
//  ContentView.swift
//  WeSplit
//
//  Created by APPLE on 06/04/24.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    let tipPercentages = [10,15,20,25,0]
    @FocusState private var amountIsFocused:Bool
    var totalCheckAmount:Double{
        let tipSelection = Double(tipPercentage)
        return checkAmount + tipSelection
    }
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercentage)

        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount

        return amountPerPerson
    }
    var body: some View {
        NavigationStack{
            Form{
                Section{
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD")).keyboardType(.decimalPad).focused($amountIsFocused)
                    
                    Picker("Number of People",selection: $numberOfPeople){
                        ForEach(2..<100){
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("how much tip do you want to leave ?"){
                Picker("Tip Percentage",selection: $tipPercentage){
                    ForEach(0..<101){
                            Text($0,format: .percent)
                        }
                    }
                .pickerStyle(.navigationLink)
                }
                
                Section("Total amount for the check"){
                    Text(totalCheckAmount,format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                  .background(tipPercentage == 0 ? .red : .gray )
                }
                
                Section("Amount Per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
            }
           .navigationTitle("WeSplit")
           .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
