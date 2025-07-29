//
//  RestBetterView.swift
//  RestBetter
//  Created by Wintersolid Studios on 7/16/25.
//

import SwiftUI

struct RestBetterView: View {
  @StateObject private var viewModel = RestBetterViewModel()
  
  static var defaultWakeUp: Date {
    var components = DateComponents()
    components.hour = 7
    components.minute = 0
    return Calendar.current.date(from: components) ?? .now
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        Image("Drk-Koala-BG")
          .resizable()
              .frame(width: 400)
              .frame(maxHeight: .infinity)
              .opacity(0.5)
        
        VStack {
          Spacer()
          
          Text("Pick time to Awaken:")
            .font(.title)
            .foregroundStyle(.white)
          
          DatePicker("", selection: $viewModel.wakeUp, displayedComponents: .hourAndMinute)
            .labelsHidden()
            .accessibilityIdentifier("WakeUpPicker")
          
          Spacer()
          
          Stepper(value: $viewModel.sleepAmount, in: 1...12, step: 0.5) {
            HStack {
              Text("Sleep atleast #hours:")
                .font(.title2)
                .fontWeight(.bold)
              Text("\(viewModel.sleepAmount.formatted())")
                .font(.title)
                .fontWeight(.semibold)
            }
          }
          .padding()
          .accessibilityIdentifier("SleepStepper")
          
          Stepper(value: $viewModel.coffeeAmount, in: 1...12, step: 1) {
            HStack {
              Text("    Coffee #cups:")
                .font(.title2)
                .fontWeight(.bold)
              Text("          \(viewModel.coffeeAmount)")
                .font(.title)
                .fontWeight(.semibold)
            }
          }
          .padding()
          .accessibilityIdentifier("CoffeeStepper")
          
          Spacer()
          
          HStack {
            Text("Advise to Sleep at: ")
              .font(.title2)
              .fontWeight(.bold)
            Text("    \(viewModel.sleepPredict ?? " ?")")
              .font(.largeTitle)
              .fontWeight(.bold)
          }
          
          Spacer()
          
          Button(action: viewModel.calculateSleepTime) {
            Text("Calculate")
          }
          .font(.largeTitle)
          .fontWeight(.bold)
          .foregroundStyle(.white)
          .buttonStyle(.borderedProminent)
          .buttonBorderShape(.capsule)
          .shadow(color: .gray, radius: 30)
          .tint(.green)
          .accessibilityIdentifier("CalculateButton")
          .alert(viewModel.alertTitle, isPresented: $viewModel.alertShown) {
            Button("Close") {}
          } message: {
            Text(viewModel.alertMsg)
          }
          
          Spacer()
        }
        .navigationTitle("Rest*Better")
        .navigationBarTitleDisplayMode(.inline)
      }
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
