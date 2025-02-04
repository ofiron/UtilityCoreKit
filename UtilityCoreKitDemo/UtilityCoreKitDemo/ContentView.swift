//
//  ContentView.swift
//  UtilityCoreKitDemo
//
//  Created by Ofir Ron on 04/02/2025.
//

import SwiftUI
import UtilityCoreKit

struct ContentView: View {
    @State private var textFromPackage = ""

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")

            Button("Some action from package") {
                let dateTimeComponents = try! Date.now.dateAndTimeComponents

                textFromPackage = "\(dateTimeComponents.year).\(dateTimeComponents.month).\(dateTimeComponents.day) : \(dateTimeComponents.hour):\(dateTimeComponents.minute):\(dateTimeComponents.second)"
            }

            Text("The time from package")
            Text(textFromPackage)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
