//
//  RestBetterView.swift
//  RestBetter
//  Created by Wintersolid Studios on 7/16/25.
//

import CoreML
import SwiftUI

struct RestBetterView: View {
  @State private var sleepAmount = 8.0
  @State private var wakeUp = defaultWakeUp
  @State private var coffeeAmount = 1
  @State private var sleepPredict: String?
  @State private var alertTitle = ""
  @State private var alertMsg = ""
  @State private var alertShown = false
  
  static var defaultWakeUp: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    return Calendar.current.date(from: components) ?? .now
  }
  
  
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
        Color.gray.opacity(0.5)
        Image("dreamer").resizable().frame(width:400,height:300)
        VStack(spacing: 30){
          
          Spacer()
          
          Text("Pick time to Awaken:").font(.title)
          
          DatePicker("Pick time to Awaken", selection: $wakeUp,displayedComponents:.hourAndMinute).labelsHidden().accessibilityIdentifier("WakeUpPicker")
          
          Stepper(value: $sleepAmount, in: 1...12, step: 0.5) {
            
            HStack {
              Text("Sleep atleast #hours:")
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
              Text("    Coffee #cups:")
                .font(.title2)
                .fontWeight(.thin)
                .foregroundStyle(.white)
              
              coloredcoffeeAmountValues
            }
          }
          .padding()
          .accessibilityIdentifier("SleepStepper")
          
          VStack {
            Text("Advise to Sleep at: ").font(.title2).fontWeight(.light)
            Text("\(sleepPredict ?? " ?")" ).font(.largeTitle).foregroundStyle(.yellow).fontWeight(.semibold)
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
          .accessibilityIdentifier("CalculateButton").alert(alertTitle, isPresented: $alertShown){
            Button("close"){}
          } message: {
            Text(alertMsg)
            
          }
          
          Spacer()
        }
        .navigationTitle("RestBetter").navigationBarTitleDisplayMode(.inline)
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
      let sleepTime = wakeUp - TimeInterval(prediction.actualSleep)
      sleepPredict = sleepTime.formatted(date: .omitted, time: .shortened)
      
      
    } catch  {
      alertTitle = "Error:"
      alertMsg = "Data unvailable"
      alertShown = true
    }
  }
}




#Preview("Light Mode") {
  RestBetterView()
    .preferredColorScheme(.light)
}

#Preview ("Dark Mode"){
  RestBetterView()
    .preferredColorScheme(.dark)
}
