//  ZodioTests.swift
//  ZodioTests

import XCTest
@testable import Zodio

class ZodioTests: XCTestCase {
    
    //New instance
    var vc = MainVC()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

/*
    //Test the state change in the textField
    func testCheckIfTextFieldIsEmpty() {
        let sign = "scorpio"
        let nilSign: String? = nil
        
        XCTAssertTrue(vc.checkIfTextFieldIsEmpty(string: sign), "A zodiac sign has been entered")
        XCTAssertFalse(vc.checkIfTextFieldIsEmpty(string: nilSign))
    }
 
*/

}
