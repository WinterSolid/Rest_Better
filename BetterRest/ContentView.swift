//
//  ContentView.swift
//  BetterRest
//  Created by Wintersolid Studios on 7/16/25.
//

import CoreML
import SwiftUI

struct ContentView: View {
  @State private var sleepAmount = 8.0
  @State private var wakeUp = Date.now
  @State private var coffeeAmount = 1
  @State private var predictions = 0.0
  
  var coloredSleepAmountValues: some View {
    Text("\(sleepAmount.formatted())")
      .font(.title)
      .fontWeight(.semibold)
      .foregroundColor(.blue)
  }
  var coloredcoffeeAmountValues: some View{
    Text("\(coffeeAmount)")
      .font(.title)
      .fontWeight(.semibold)
      .foregroundStyle(coffeeAmount < 4 ? .white : .orange)
  }
  
  var body: some View {
    NavigationStack {
      ZStack{
        Color.gray.opacity(0.2)
        Image("dreamer").resizable().frame(width:400,height:300)
        VStack(spacing: 30){
          
          Spacer()
          
          Text("Pick time to sleep:").font(.title)
          
          DatePicker("Pick time to sleep:", selection: $wakeUp,displayedComponents:.hourAndMinute).labelsHidden().accessibilityIdentifier("WakeUpPicker")
          
          Stepper(value: $sleepAmount, in: 1...12, step: 0.5) {
            
            HStack {
              Text("Sleep # of hours:")
                .font(.title2)
                .fontWeight(.thin)
                .foregroundStyle(.white)
              coloredSleepAmountValues
            }
          }
          .padding()
          .accessibilityIdentifier("SleepStepper")
          
          Stepper(value: $coffeeAmount, in: 1...12, step: 1) {
            HStack {
              Text("    Coffee cups:")
                .font(.title2)
                .fontWeight(.thin)
                .foregroundStyle(.white)
              
              coloredcoffeeAmountValues
            }
          }
          .padding()
          .accessibilityIdentifier("SleepStepper")
          
          VStack {
            Text("Best to Sleep").font(.title2).fontWeight(.light)
            Text("\(predictions,specifier: "%.2f") hours" ).font(.title3).fontWeight(.semibold)
          }
        
          
          Spacer()
          
          Button(action: calculateSleepTime) {
            Text("Calculate")
          }
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundStyle(.white)
          .buttonStyle(.borderedProminent)
          .buttonBorderShape(.capsule).shadow(color: .gray,radius: 30)
          .tint(.green)
          .accessibilityIdentifier("CalculateButton")
          
          Spacer()
        }
        .navigationTitle("BetterRest").navigationBarTitleDisplayMode(.inline)
      }
    }
  }
  
  func calculateSleepTime() {
    do {
      // config object that holds runtime params for Core ML model.
      let config = MLModelConfiguration()
      let model = try SleepCalculatorModel(configuration: config)
      let components = Calendar.current.dateComponents([.hour,.minute], from: wakeUp)
      
      let hour = (components.hour ?? 0) * 60 * 60 // mins * secs
      let minute = (components.minute ?? 0) * 60 // * secs
      
      // call prediction model
      let prediction = try model.prediction(
        wake: Double(hour + minute),
        estimatedSleep: Double(sleepAmount),
        coffee: Double(coffeeAmount)
      )
      predictions = (prediction.actualSleep)
    } catch  {
      print("Error: Data unvailable")
    }
  }
}




#Preview {
  ContentView()
}
