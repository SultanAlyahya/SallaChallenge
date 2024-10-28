//
//  BrandView.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 24/04/1446 AH.
//

import SwiftUI

struct BrandView: View {
    @StateObject var vm = BrandVM()
    @State var cellFont = Font.sallaRegular(size: 14)
    @State var destinationID: UUID? = nil
    let columns = [
           GridItem(.flexible()),
           GridItem(.flexible())
       ]
    var body: some View {
        NavigationStaskSupport {
            destinations()
            ScrollView {
                Text(vm.state.title)
                    .padding(.vertical ,12)
                    .font(Font.sallaRegular(size: 28))
                Image("brandCover", bundle: .main)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Text(vm.state.label)
                    .padding(12)
                    .font(Font.sallaRegular(size: 20))
                
                Text(vm.state.brandDescription)
                    .padding(.bottom, 8)
                    .multilineTextAlignment(.center)
                    .font(Font.sallaRegular(size: 16))
                
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
                        .onTapGesture {
                            routeTo(id: product.id)
                        }
                        .onAppear{
                            vm.loadCell()
                        }
                    }
                }
            }
            .padding(.horizontal, 8)
            .background(Color.primaryBackGround)
        }
    }
    
    @ViewBuilder func destinations() -> some View {
        ForEach(vm.state.products) { product in
            NavigationLink(tag: product.id, selection: $destinationID, destination: {ProductView(product: product)}, label: {EmptyView()})
        }
    }
    
    func routeTo(id: UUID) {
        destinationID = id
    }
    
    func changeFont() {
        cellFont = Font.sallaMedium(size: 14)
    }
}

#Preview {
    BrandView()
}
