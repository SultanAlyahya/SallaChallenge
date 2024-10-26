//
//  BrandRepo.swift
//  SallaChallengeTests
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import XCTest
@testable import SallaChallenge

final class BrandRepoTest: XCTestCase {
    
    let mockRemoteDataSource = MockRemoteDataSource()

    override func setUpWithError() throws {
        InjectedValues[\.remoteDataSource] = mockRemoteDataSource
    }

    override func tearDownWithError() throws {
       
    }

    func testExample() async throws {
        let brandRepo = BrandDataRepo()
        do {
            let brandDtp = try await brandRepo.getBrandProducts(url: nil)
            XCTAssertEqual(mockRemoteDataSource.url!.absoluteString, SallaAPIs.getEndpoint(endPoint: .brands).absoluteString)
            let brandDtpPagging = try await brandRepo.getBrandProducts(url: "hhtps://google.com")
            XCTAssertNotEqual(mockRemoteDataSource.url!.absoluteString, SallaAPIs.getEndpoint(endPoint: .brands).absoluteString)
            XCTAssertEqual(mockRemoteDataSource.headers!, SallaAPIs.addSallaHeader())
        }
        catch {
            guard error as? DecodingError == nil else {
                return
            }
            XCTFail("Expected success but got error: \(error)")
        }
    }
}
