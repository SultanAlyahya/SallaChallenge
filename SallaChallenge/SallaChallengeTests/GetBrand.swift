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

    func testExample() async throws {
        do {
            let getBrandUseCase = GetBrandUseCase()
            let brand = try await getBrandUseCase.run()
            XCTAssertNil(brand.nextProductsPage)
            XCTAssertEqual(brand.product.count, 1)
            XCTAssertEqual(brand.title, "Sultan's brand")
        }
        catch {
            XCTFail("Expected success but got error: \(error)")
        }

    }
}
