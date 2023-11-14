//
//  ContentView.swift
//  Better Rest
//
//  Created by Cameron Warner on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 0...13, step: 0.25)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
