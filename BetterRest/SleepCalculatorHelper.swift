//
//  SleepCalculatorHelper.swift.swift
//  BetterRest
//
//  Created by Wintersolid Studios on 7/27/25.
//

import SwiftUI
import CoreML

struct SleepCalculatorHelper {
    static func calculateBedtime(wakeUp: Date, sleepAmount: Double, coffeeAmount: Int) throws -> Date {
        let config = MLModelConfiguration()
        let model = try SleepCalculator(configuration: config)

        let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
        let hour = (components.hour ?? 0) * 60 * 60
        let minute = (components.minute ?? 0) * 60

        let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

        return wakeUp - prediction.actualSleep
    }
}

