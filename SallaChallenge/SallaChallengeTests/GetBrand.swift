//
//  GetBrand.swift
//  SallaChallengeTests
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import XCTest
@testable import SallaChallenge

final class GetBrand: XCTestCase {

    override func setUpWithError() throws {
        InjectedValues[\.brandRepo] = MockBrandRepo()
    }

    override func tearDownWithError() throws {
        
    }

    func testExample() throws {

        let getBrandUseCase = GetBrandUseCase()
        let brand = getBrandUseCase.run()
        XCTAssertNil(brand.next)
        XCTAssertNil(brand.salePrice)
        XCTAssertEqual(brand.title, "Sultan's brand")

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
