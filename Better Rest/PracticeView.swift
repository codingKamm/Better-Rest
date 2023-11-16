//
//  PracticeView.swift
//  Better Rest
//
//  Created by Cameron Warner on 11/15/23.
//

import SwiftUI

struct PracticeView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    @State private var coffeeAmount = 1
    
    var body: some View {
        VStack{
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 0...13, step: 0.25)
            DatePicker("Please Enter a time", selection: $wakeUp, in: Date.now...)
                .labelsHidden()
            Text(Date.now, format: .dateTime.hour().minute()) //Gives a time from a date
            Text(Date.now, format: .dateTime.day().month().year()) //Gives us a day, month, year
        }
        .padding()
    }
}

#Preview {
    PracticeView()
}
