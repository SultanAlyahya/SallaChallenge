//
//  ProductCellDetails.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import SwiftUI

struct ProductCellDetails: Identifiable {
    let id = UUID()
    let name: String
    let specialOffer: Bool
    let currency: String
    let price: Double
    var cover: Image
}
