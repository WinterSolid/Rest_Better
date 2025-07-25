//
//  ContentView.swift
//  BetterRest
//
//  Created by Zakee Tanksley on 7/16/25.
//

import SwiftUI

struct ContentView: View {
  @State private var sleepAmount = 8.0
  func titleText(amount: Float) -> some View {HStack {
    Text("Sleep Amount: ")
    Text("\(Int(sleepAmount)) hours").foregroundStyle( sleepAmount < 7  ?.red : .blue)
  }
  }
  
    var body: some View {
      Stepper(value: $sleepAmount, in: 1...12, step: 1) {
        titleText(amount: Float(sleepAmount))
      }
    }
}

#Preview {
    ContentView()
}
