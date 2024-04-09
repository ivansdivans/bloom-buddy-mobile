//
//  BloomBuddyMLTests.swift
//  BloomBuddyMobileTests
//
//  Created by Daan Brocatus on 09/04/2024.
//

import XCTest
@testable import BloomBuddyMobile

final class BloomBuddyMLTests: XCTestCase {
    private var sut: BloomBuddyML!
    
    override func setUpWithError() throws {
        sut = BloomBuddyML.shared
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_PredictRose() {
        guard let image = UIImage(named: "rose", in: Bundle(for: type(of: self)), compatibleWith: nil) else {
            XCTFail("Failed to load test image")
            return
        }
        let expectation = XCTestExpectation(description: "Classification completed")
        sut.classifyImage(image) { predictions in
            XCTAssertNotNil(predictions)
            if let predictions = predictions {
                XCTAssertFalse(predictions.isEmpty)
                XCTAssertEqual(predictions.count, Constants.MLModel.amountOfClasses)
                XCTAssertTrue(predictions.first!.confidence > 0.9)
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 5.0)
    }
}
