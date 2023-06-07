//
//  CarouselPaginationView.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 30.05.2023.
//

import SwiftUI

struct CarouselPaginationView: View {
    let pagesCount: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack() {
            ForEach((0..<pagesCount), id:\.self) { index in
                Circle()
                    .fill(index == self.currentPage ? .white : .white.opacity(0.5))
                    .frame(width: 10, height: 10)

            }

        }
    }
}

struct CarouselPaginationView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselPaginationView(pagesCount: 4, currentPage: .constant(2))
            .background(.blue)
    }
}
