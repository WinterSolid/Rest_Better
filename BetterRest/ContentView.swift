//
//  ContentView.swift
//  BetterRest
//
//  Created by Wintersolid Studios on 7/16/25.
//

import SwiftUI

struct ContentView: View {
  @State private var sleepAmount = 8.0
  @State private var wakeUp = Date.now
  @State private var coffeeAmount = 1
  
  var coloredSleepAmountValues: some View {
    Text("\(sleepAmount.formatted())")
             .foregroundColor(sleepAmount < 7 ? .blue : .red)
     }
  var coloredcoffeeAmountValues: some View{
    Text("\(coffeeAmount)").foregroundStyle(coffeeAmount < 3 ? .blue : .orange )
  }
  
  var body: some View {
    NavigationStack {
      VStack(spacing: 30){
        Text("When do you want to wake up")
          .font(.headline)
        Text("Pick time to sleep:").font(.title)
        DatePicker("Pick time to sleep:", selection: $wakeUp,displayedComponents:.hourAndMinute).labelsHidden()
          
        
        Stepper(value: $sleepAmount, in: 1...12, step: 1) {
          HStack {
            Text("How many hours of sleep:").font(.title2)
            coloredSleepAmountValues
          }.padding()
        }
        
        Stepper(value: $coffeeAmount, in: 1...12, step: 1) {
          HStack {
            Text("How many cups of coffee:").font(.title2)
            coloredcoffeeAmountValues
          }.padding()
        }
        Button("Calculate") {
          
        }.font(.title)
          .foregroundStyle(.blue)
          .buttonStyle(.bordered)
          .buttonBorderShape(.capsule).tint(.blue)
      }
      
    }
  }
}




#Preview {
  ContentView()
}
