//
//  RestBetterViewModel.swift
//  RestBetter
//
//  Created by Wintersolid Studios on 7/29/25.
//

import Foundation
import Combine
import CoreML
import SwiftUI

// ObservableObject - SwiftUI protocol - allows SwiftUI Views to observe this ViewModel.
// @Published - marks properties Views should react to when changed.
// This enables @StateObject in RestBetterView to manage its lifecycle correctly.
class RestBetterViewModel: ObservableObject {
  @Published var sleepAmount = 8.0
  @Published var wakeUp = RestBetterView.defaultWakeUp
  @Published var coffeeAmount = 1
  @Published var sleepPredict: String? = nil
  @Published var alertTitle = ""
  @Published var alertMsg = ""
  @Published var alertShown = false
  
  func calculateSleepTime() {
    do {
      let config = MLModelConfiguration()
      let model = try SleepCalculatorModel(configuration: config)
      let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
      
      let hour = (components.hour ?? 0) * 60 * 60
      let minute = (components.minute ?? 0) * 60
      
      let prediction = try model.prediction(
        wake: Double(hour + minute),
        estimatedSleep: sleepAmount,
        coffee: Double(coffeeAmount)
      )
      let sleepTime = wakeUp - TimeInterval(prediction.actualSleep)
      sleepPredict = sleepTime.formatted(date: .omitted, time: .shortened)
      
    } catch {
      alertTitle = "Error:"
      alertMsg = "Data unavailable"
      alertShown = true
    }
  }
}

