//
//  CircleButton.swift
//  SallaChallenge
//
//  Created by Sultan alyahya on 25/04/1446 AH.
//

import SwiftUI


extension ProductView {
    struct CircleButton: View {
        let image: Image
        let action: () -> ()
        var body: some View {
            Button {
                action()
            } label: {
                VStack {
                    image
                        .resizable()
                        .scaledToFit()
                        .foregroundStyle(.gray)
                        .frame(maxWidth: 30, maxHeight: 30)
                }
                .frame(maxWidth: 50, maxHeight: 50)
                .padding(2)

            }
            .background(.white)
            .clipShape(Circle())
            .shadow(radius: 2, y: 1)
        }
    }
}


#Preview {
    ProductView.CircleButton(image: Image(systemName: "heart.fill"), action: {})
}
