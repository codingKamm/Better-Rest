//
//  ContentView.swift
//  Better Rest
//
//  Created by Cameron Warner on 11/13/23.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = defaultWakeUpTime
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }

    func caculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCaculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            
            let hour = (components.hour ?? 0) * 60 * 60
            let minuets = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(wake: Int64(Double(hour + minuets)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            
            let sleepTime = wakeUp - prediction.actualSleep
            alertTitle = "Your ideal bedtime is..."
            alertMessage = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem caculating your bedtime."
        }
        showingAlert = true
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
            
            VStack(alignment: .leading, spacing: 0) {
                    Text("Desired Amount of Sleep")
                        .font(.headline)
                        .dynamicTypeSize(.xLarge)
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                    Divider()
                    
                    Text("Daily Coffee Intake")
                        .font(.headline)
                        .dynamicTypeSize(.xLarge)
                Stepper("^[\(coffeeAmount) cup](inflect: true)", value: $coffeeAmount, in: 1...20)
                    Divider()
                }
               
                
            }
            .padding()
            .navigationTitle("Better Rest")
            
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("Ok") {}
            } message: {
                Text(alertMessage)
            }
            .toolbar {
                Button("Caculate", action: caculateBedtime)
            }
        }

    }
}

#Preview {
    ContentView()
}
