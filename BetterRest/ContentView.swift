//
//  ContentView.swift
//  BetterRest
//
//  Created by Wintersolid Studios on 7/16/25.
//

import SwiftUI

struct ContentView: View {
  @State private var sleepAmount = 8.0
  func titleText(amount: Float) -> some View {
    HStack {
      Text("Sleep Amount: ")
      Text(String(format: "%.1f", Double(sleepAmount)))
        .fontWeight(.semibold)
        .foregroundStyle( sleepAmount < 4  ?.red : .blue)
      Text("hours")
    }.font(.title3)
  }
  
  var body: some View {
    Stepper(
      value: $sleepAmount,
      in: 1...12,
      step: 0.5){
        titleText(amount: Float(sleepAmount))
      }
  }
}




#Preview {
  ContentView()
}
