//
//  InjectionKey.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 23/04/1446 AH.
//

import Foundation

public protocol InjectionKey {

    associatedtype Value

    static var currentValue: Self.Value { get set }
}
