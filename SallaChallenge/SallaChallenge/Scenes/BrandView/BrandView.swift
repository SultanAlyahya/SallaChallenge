//
//  BrandView.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 24/04/1446 AH.
//

import SwiftUI

struct BrandView: View {
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
        ScrollView {
            Text("brand name")
                .padding(.vertical ,12)
            Image("brandCover", bundle: .main)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text("label")
                .padding(12)
            
            Text("Description Description Description Description Description Description Description")
                .padding(.bottom, 8)
                .multilineTextAlignment(.center)
            
            LazyVGrid(columns: columns, spacing: 8) {
                ForEach(0..<10) { _ in
                    ProductCell()
                }
            }
        }
        
        .padding(.horizontal, 8)
        .background(Color(red: 0.91, green: 0.91, blue: 0.92))
    }
}

#Preview {
    BrandView()
}
