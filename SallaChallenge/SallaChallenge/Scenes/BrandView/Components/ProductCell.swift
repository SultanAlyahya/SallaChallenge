//
//  ProductCell.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 24/04/1446 AH.
//

import SwiftUI

struct ProductCell: View {
    @Binding var font: Font
    let image: Image
    let price: Double
    let currency: String
    let name: String
    let addAction: () -> ()
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
                addAction()
            } label: {
                Text("أضف للسلة")
                    .foregroundStyle(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 50)
                    .background(Color.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .font(font)
            }
        }
        .frame(minHeight: 300)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 5))
    }
}

#Preview {
    ProductCell(font: .constant(Font.system(size: 18)), image: Image("brandCover", bundle: .main), price: 10.0, currency: "SAR", name: "Item", addAction:{})
}
