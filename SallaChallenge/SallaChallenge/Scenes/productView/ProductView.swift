//
//  ProductView.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import SwiftUI

struct ProductView: View {
    @State private var currentPage = 0
    let images: [Image]
    let product: ProductCellDetails
    init(product: ProductCellDetails) {
        self.product = product
        images = [product.cover, product.cover, product.cover]
    }

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<images.count, id: \.self) { index in
                    images[index]
                        .resizable()
                        .scaledToFill()
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .frame(height: 300)
            .cornerRadius(10)
            .padding(.horizontal, 10)
            Spacer()
            ZStack(alignment: .topLeading) {
                HStack {
                    Text("Logo")
                        .font(.sallaMedium(size: 30))
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text(product.name)
                            .font(.sallaMedium(size: 30))
                            .padding(.vertical, 12)
                        Text("\(product.currency) \(String(format: "%.2f", product.price))")
                            .font(.sallaMedium(size: 20))
                            .padding(.horizontal, 8)
                    }
                }
                .padding()
                .padding(.bottom, 40)
                .clipShape(RoundedCorner(radius: 20, corners: [.topLeft, .topRight]))
                .overlay(
                    RoundedCorner(radius: 20, corners: [.topLeft, .topRight]).stroke(lineWidth: 0.2)
                )
                
                CircleButton(image: Image(systemName: "heart.fill"), action: {print("liked")})
                    .offset(x: 25, y: -25)
                CircleButton(image: Image(systemName: "square.and.arrow.up.fill"), action: {print("liked")})
                    .offset(x: 100, y: -25)
               
            }
            
        }
        .ignoresSafeArea()
    }
       
    let timer = Timer.publish(every: 2, on: .main, in: .common).autoconnect()
}

#Preview {
    ProductView(product: ProductCellDetails(name: "hello", specialOffer: false, currency: "SAR", price: 10.0, cover:  Image("brandCover", bundle: .main)))
}
