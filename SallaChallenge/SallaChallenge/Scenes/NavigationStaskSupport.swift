//
//  NavigationStaskSupport.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import SwiftUI

struct NavigationStaskSupport<Content>: View where Content: View {
    @ViewBuilder var content: () -> Content
        
        var body: some View {
            if #available(iOS 16, *) {
                NavigationStack(root: content)
            } else {
                NavigationView(content: content)
            }
        }
}

