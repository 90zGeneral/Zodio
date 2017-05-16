//  SpotifyTrackTest.swift
//  Zodio

import XCTest
@testable import Zodio

class SpotifyTrackTest: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //Test class initializer for SpotifyTrack
    func testInit_ShouldTakeDictionary() {
        
        let dict: [String: Any] = ["title": "Love Birds", "artwork_url": "http://a1.image.com/artwork-large.png", "user": "Beastman"]
        let sound = SpotifyTrack(trackDict: dict)
        
        XCTAssertEqual(sound.trackName, "Love Birds")
        XCTAssertFalse(sound.username == "Beastman")
        XCTAssertTrue(sound.trackImg == "http://a1.image.com/artwork-large.png")
    }
}
