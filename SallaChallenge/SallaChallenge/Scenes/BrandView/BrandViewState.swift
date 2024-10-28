//
//  BrandViewState.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import Foundation

struct BrandViewState {
    var title = ""
    var coverURL: String? = nil
    var label = ""
    var isBrandLoaded = false
    var brandDescription = ""
    var products = [ProductCellDetails]()
}
