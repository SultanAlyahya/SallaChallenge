//
//  BrandVM.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 24/04/1446 AH.
//

import SwiftUI


class BrandVM: ObservableObject {
    @Injected(\.getBrandUseCase) var getBrandUseCase
    @Published var state = BrandViewState()
    var nextProductURL: String? = nil
    var cellLoaded = 0
    init() {
        Task(priority: .userInitiated) {
            await getBrand()
        }
    }
    func getBrand() async {
        do {
            let brand = try await getBrandUseCase.run(page: nil)
            await setNewBrand(brand: brand)
        }
        catch {
            print("got error: \(error)")
        }
    }
    
    func loadCell() {
        cellLoaded += 1
        if cellLoaded == state.products.count {
            Task(priority: .userInitiated) {
                await getNextProducts()
            }
        }
    }
    
    func getNextProducts() async {
        guard let nextProductURL = nextProductURL else {
            return
        }
        do {
            let brand = try await getBrandUseCase.run(page: nextProductURL)
            await addNewProducts(brand: brand)
        }
        catch {
            print("got error: \(error)")
        }
    }
    
    @MainActor func addNewProducts(brand: Brand) {
        for product in brand.product {
            state.products.append(ProductCellDetails(
                name: product.name,
                specialOffer: product.specialOffer,
                currency: product.currency,
                price: product.price,
                cover: nil))
        }
        nextProductURL = brand.nextProductsPage
    }
    
    @MainActor func setNewBrand(brand: Brand) {
        state.coverURL = brand.logoURL ?? ""
        state.title = brand.title ?? ""
        state.label = brand.label ?? ""
        state.brandDescription = brand.description ?? ""
        for product in brand.product {
            state.products.append(ProductCellDetails(
                name: product.name,
                specialOffer: product.specialOffer,
                currency: product.currency,
                price: product.price,
                cover: nil))
        }
        state.isBrandLoaded = true
        nextProductURL = brand.nextProductsPage
    }
}
