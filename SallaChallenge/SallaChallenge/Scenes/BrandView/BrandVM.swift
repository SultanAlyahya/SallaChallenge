//
//  BrandVM.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 24/04/1446 AH.
//

import SwiftUI


class BrandVM: ObservableObject {
    @Injected(\.getBrandUseCase) private var getBrandUseCase
    @Injected(\.getImageUseCase) private var getimageUseCase
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
    
    func getProductImage(productID: UUID, coverURL: String) async {
        do {
            let imageData = try await getimageUseCase.run(imageURL: coverURL)
            if let image = UIImage(data: imageData) {
                await setProductImage(image: Image(uiImage: image), productID: productID)
            }
        }
        catch {
            print("error: \(error)")
        }
    }
    
    @MainActor func setProductImage(image: Image, productID: UUID) {
        if let index = state.products.firstIndex(where: { $0.id == productID }) {
            state.products[index].cover = image
        }
    }
    
    @MainActor func addNewProducts(brand: Brand) {
        for product in brand.product {
            let productDetails = ProductCellDetails(
                name: product.name,
                specialOffer: product.specialOffer,
                currency: product.currency,
                price: product.price,
                cover: Image("brandCover", bundle: .main))
            state.products.append(productDetails)
            if let coverURL = product.coverURL {
                Task(priority: .userInitiated) {
                    await getProductImage(productID: productDetails.id, coverURL: coverURL)
                }
            }
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
                cover: Image("brandCover", bundle: .main)))
        }
        state.isBrandLoaded = true
        nextProductURL = brand.nextProductsPage
    }
}
