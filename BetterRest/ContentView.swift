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
      .font(.title2)
      .fontWeight(.bold)
      .foregroundColor(sleepAmount < 7 ? .blue : .red)
  }
  var coloredcoffeeAmountValues: some View{
    Text("\(coffeeAmount)")
      .font(.title2)
      .fontWeight(.bold)
      .foregroundStyle(coffeeAmount < 4 ? .blue : .orange)
  }
  
  var body: some View {
    NavigationStack {
      ZStack{
        Color.gray.opacity(0.2)
        VStack(spacing: 30){
          
          Spacer()
          
          Text("When do you want to wake up")
            .font(.headline)
          Text("Pick time to sleep:").font(.title)
          
          DatePicker("Pick time to sleep:", selection: $wakeUp,displayedComponents:.hourAndMinute).labelsHidden()
          
          Stepper(value: $sleepAmount, in: 1...12, step: 1) {
            
            HStack {
              Text("Sleep # of hours:")
                .font(.title3)
              coloredSleepAmountValues
            }.padding()
          }
          
          Stepper(value: $coffeeAmount, in: 1...12, step: 1) {
            HStack {
              Text("Coffee cups drank today:")
                .font(.title3)
              coloredcoffeeAmountValues
            }.padding()
          }
          
          Spacer()
          
          Button(action: calculateSleepTime) {
            Text("Calculate")
          }
          .font(.title)
          .foregroundStyle(.green)
          .buttonStyle(.bordered)
          .buttonBorderShape(.capsule)
          .tint(.green)
          
          Spacer()
        }
        .navigationTitle("BetterRest").navigationBarTitleDisplayMode(.inline)
      }
    }
  }
  func calculateSleepTime() {
    // TODO: Calculations
    
  }
}




#Preview {
  ContentView()
}
