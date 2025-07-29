//
//  RestBetterTests.swift
//  RestBetterTests
//
//  Created by Zakee Tanksley on 7/16/25.
//
import XCTest
@testable import RestBetter  // This allows tests to access internal methods and types

final class RestBetterLogicTests: XCTestCase {

    func testBedtimeCalculation() throws {
        // Arrange
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        guard let testWakeUp = formatter.date(from: "07:00") else {
            XCTFail("Invalid test wake-up date format")
            return
        }

        let sleepAmount = 8.0
        let coffeeAmount = 1

        // Act
        let calculatedBedtime = try SleepCalculatorHelper.calculateBedtime(wakeUp: testWakeUp, sleepAmount: sleepAmount, coffeeAmount: coffeeAmount)

        // Assert
        XCTAssertNotNil(calculatedBedtime)

        let expectedBedtime = Calendar.current.date(byAdding: .hour, value: -8, to: testWakeUp)

        XCTAssertEqual(Calendar.current.component(.hour, from: calculatedBedtime),
                       Calendar.current.component(.hour, from: expectedBedtime!),
                       "Calculated bedtime hour should match expected hour")
    }
}
