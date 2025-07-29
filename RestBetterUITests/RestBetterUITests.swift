//
//  RestBetterUITests.swift
//  RestBetterUITests
//
//  Created by Wintersolid Studios on 7/16/25.
//
import XCTest

final class RestBetterUITests: XCTestCase {
  
  let app = XCUIApplication()
  
  override func setUpWithError() throws {
    continueAfterFailure = false
    app.launch()
  }
  
  func testCalculateButtonFlow() throws {
    
    let wakePicker = app.datePickers["WakeUpPicker"]
    XCTAssertTrue(wakePicker.exists)
    
    let sleepStepper = app.steppers["SleepStepper"]
    XCTAssertTrue(sleepStepper.exists)
    sleepStepper.buttons["Increment"].tap()
    
    let coffeeStepper = app.steppers["CoffeeStepper"]
    XCTAssertTrue(coffeeStepper.exists)
    coffeeStepper.buttons["Increment"].tap()
    
    let calculateButton = app.buttons["CalculateButton"]
    XCTAssertTrue(calculateButton.exists)
    calculateButton.tap()
  }
}
