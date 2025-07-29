//
//  RestBetterUITests.swift
//  RestBetterUITests
//
//  Created by Zakee Tanksley on 7/16/25.
//
import XCTest
@testable import RestBetter 

final class RestBetterUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    func testCalculateBedtimeUIFlow() throws {
        // Access sleep amount Stepper
        let sleepStepper = app.steppers["SleepStepper"]
        XCTAssertTrue(sleepStepper.exists)
        sleepStepper.buttons["Increment"].tap()

        // Access coffee amount Stepper
        let coffeeStepper = app.steppers["CoffeeStepper"]
        XCTAssertTrue(coffeeStepper.exists)
        coffeeStepper.buttons["Increment"].tap()

        // Tap Calculate Button
        let calculateButton = app.buttons["CalculateButton"]
        XCTAssertTrue(calculateButton.exists)
        calculateButton.tap()

    }
}
