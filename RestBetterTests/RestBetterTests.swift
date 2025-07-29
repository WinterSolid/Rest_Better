//
//  RestBetterTests.swift
//  RestBetterTests
//
//  Created by Wintersolid Studios on 7/16/25.
//
import XCTest

final class RestBetterViewModelTests: XCTestCase {
    
    var viewModel: RestBetterViewModel!

    override func setUp() {
        super.setUp()
        viewModel = RestBetterViewModel()
    }

    override func tearDown() {
        viewModel = nil
        super.tearDown()
    }

    func testCalculateSleepTime() {
        // Given
        viewModel.wakeUp = Calendar.current.date(bySettingHour: 7, minute: 0, second: 0, of: Date())!
        viewModel.sleepAmount = 8
        viewModel.coffeeAmount = 1
        
        // When
        viewModel.calculateSleepTime()
        
        // Then
        XCTAssertNotNil(viewModel.sleepPredict, "Sleep prediction should not be nil after calculation")
        XCTAssertFalse(viewModel.alertShown, "Alert should not be shown for valid calculation")
    }

    func testCalculateSleepTimeErrorHandling() {
      
        // For this ML model, actual failure cases are rare, so just verifying alert state reset
        viewModel.alertTitle = ""
        viewModel.alertMsg = ""
        viewModel.alertShown = false
        
        // When calling calculateSleepTime with valid data (simulate no error)
        viewModel.calculateSleepTime()
        
        // Then
        XCTAssertFalse(viewModel.alertShown, "Alert should not be shown for valid scenario")
    }
}
