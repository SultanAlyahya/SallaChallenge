//
//  BrandViewState.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import SwiftUI

struct BrandViewState {
    var title = ""
    var coverURL: String? = nil
    var label = ""
    var isBrandLoaded = false
    var brandDescription = ""
    var products = [ProductCellDetails]()
}

struct ProductCellDetails: Identifiable {
    let id = UUID()
    let name: String
    let specialOffer: Bool
    let currency: String
    let price: Double
    let cover: Image?
}
