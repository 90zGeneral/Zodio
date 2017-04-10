//  ZodioUITests.swift
//  ZodioUITests

import XCTest
import Foundation

class ZodioUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.

        
        let app = XCUIApplication()
        let eGScorpioTextField = app.textFields["e.g. scorpio"]
        
        //Test that the textField is empty before tap gesture
        XCTAssertEqual(eGScorpioTextField.value as! String?, "")
        
        eGScorpioTextField.tap()
        eGScorpioTextField.typeText("capricorn")
        
        //Test that the textField input value equals to "capricorn" and not "libra" after editing has finish
        XCTAssertFalse(eGScorpioTextField.value as! String == "libra")
        XCTAssertTrue(eGScorpioTextField.value as! String == "capricorn")
        
        app.typeText("\r")
        
        //Test that the textField no longer exist after the "return" key press
        XCTAssertEqual(eGScorpioTextField.exists, false)
        
        //Test the number of rows in the table right after the "return" key press
        XCTAssertEqual(app.tables.tableRows.count, 0)
        
    }
    
}
