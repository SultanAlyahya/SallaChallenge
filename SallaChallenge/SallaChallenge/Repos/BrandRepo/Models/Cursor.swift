//
//  Cursor.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation


struct Cursor: Codable {
    let current: String?
    let previous: String?
    let next: String?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case current = "current"
        case previous = "previous"
        case next = "next"
        case count = "count"
    }
}
