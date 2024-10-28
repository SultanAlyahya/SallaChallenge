//
//  BrandView.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 24/04/1446 AH.
//

import SwiftUI

struct BrandView: View {
    @StateObject var vm = BrandVM()
    @State var cellFont = Font.sallaRegular(size: 18)
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
        NavigationStaskSupport {
            ScrollView {
                Text(vm.state.title)
                    .padding(.vertical ,12)
                Image("brandCover", bundle: .main)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(vm.state.label)
                    .padding(12)
                
                Text(vm.state.brandDescription)
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.center)
                
                LazyVGrid(columns: columns, spacing: 8) {
                    ForEach(vm.state.products) { product in
                        ProductCell(
                            font: $cellFont,
                            image: product.cover,
                            price: product.price,
                            currency: product.currency,
                            name: product.name,
                            addAction: changeFont
                        )
                        .onAppear{
                            vm.loadCell()
                        }
                    }
                }
            }
            .padding(.horizontal, 8)
            .background(Color(red: 0.91, green: 0.91, blue: 0.92))
        }
    }
    
    func changeFont() {
        cellFont = Font.sallaMedium(size: 22)
    }
}

#Preview {
    BrandView()
}
