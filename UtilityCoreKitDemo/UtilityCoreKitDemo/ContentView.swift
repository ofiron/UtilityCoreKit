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
                let logger: Logger = DebugAreaLoggerRepository()
                logger.log(.info, "The log message")
                textFromPackage = "See console for log"
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
