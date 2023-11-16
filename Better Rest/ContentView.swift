//
//  ContentView.swift
//  Better Rest
//
//  Created by Cameron Warner on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 1
    
//    let components = Calendar.current.dateComponents([.hour,.minute], from: someDate)
//    let hour = components.hour ?? 0
//    let minute = components.minute ?? 0
    
//    components.hour = 8
//    components.minute = 0
//    let date = Calendar.current.date(from: components) ?? .now
    func caculateBedtime() {
        
    }
    
    var body: some View {
    NavigationStack {
            VStack {
                Text("When would you like to wake up?")
                    .font(.headline)
                    .dynamicTypeSize(.xxxLarge)
                DatePicker("Pleasse Enter a Time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Divider()
                Text("Desired Amount of Sleep")
                    .font(.headline)
                    .dynamicTypeSize(.xxxLarge)
                Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                Divider()
                Text("Daily Coffee Intake")
                    .font(.headline)
                    .dynamicTypeSize(.xxxLarge)
                Stepper("\(coffeeAmount) cup(s)", value: $coffeeAmount, in: 1...20)
                Divider()
               
               
                
            }
            .padding()
            .navigationTitle("Better Rest")
            .toolbar {
                Button("Caculate", action: caculateBedtime)
            }
        }

    }
}

#Preview {
    ContentView()
}
