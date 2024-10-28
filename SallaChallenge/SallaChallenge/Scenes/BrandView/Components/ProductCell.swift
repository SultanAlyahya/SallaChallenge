//
//  ProductCell.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 24/04/1446 AH.
//

import SwiftUI

struct ProductCell: View {
    let image: Image
    let price: Double
    let currency: String
    let name: String
    var body: some View {
        VStack(alignment: .trailing) {
            image
                .resizable()
                .aspectRatio(16 / 9, contentMode: .fit)
                .frame(maxHeight: 150)
            Text(name)
                .padding(.horizontal, 8)
            Spacer()
            Text("\(currency) \(String(format: "%.2f", price))")
                .padding(.horizontal, 8)
           
            Button {
                print("add to cart")
            } label: {
                Text("أضف للسلة")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
        .frame(minHeight: 300)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    ProductCell(image: Image("brandCover", bundle: .main), price: 10.0, currency: "SAR", name: "Item")
}
