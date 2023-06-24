//
//  PaginationCarouselView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

struct PaginationCarouselView: View {
    @Binding var index: Int
    
    var body: some View {
        HStack() {
            ForEach((0..<BikeType.allCases.count), id:\.self) { index in
                Circle()
                    .fill(index == self.index ? .white : .white.opacity(0.5))
                    .frame(width: 10, height: 10)

            }
        }
    }
}

struct PaginationCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        PaginationCarouselView(index: .constant(1))
    }
}
