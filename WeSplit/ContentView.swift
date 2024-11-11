//
//  ContentView.swift
//  WeSplit
//
//  Created by Noble Udechukwu on 04/11/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var numOfPeople = 2
    @State private var tipPercentage = 20
    
    let tipPercentages  = [10, 20, 15, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double (numOfPeople + 2)
        let tipSelection = Double (tipPercentage)
        
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    var body: some View {

        NavigationStack {
            Form {
                Section{
                    TextField ("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "GPB"))
                        .keyboardType(.decimalPad)
                    
                    Picker ("no of people", selection: $numOfPeople){
                        ForEach (2..<100){
                            Text ("\($0) people" )
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                Section("How much do you tip?"){
                    Picker("Tip Percentage", selection: $tipPercentage){
                        ForEach(tipPercentages, id: \.self){
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section {
                    Text (totalPerPerson, format: .currency(code: Locale.current.currency? .identifier ?? "GPB"))
                }
            }
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}
