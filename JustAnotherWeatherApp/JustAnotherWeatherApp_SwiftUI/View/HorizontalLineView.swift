//
//  HorizontalLineView.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import SwiftUI

struct HorizontalLineView: View {
    var body: some View {
        Divider()
            .frame(height: 2)
            .overlay(.black)
            .padding(.horizontal, 20)
    }
}

struct HorizontalLineView_Previews: PreviewProvider {
    static var previews: some View {
        HorizontalLineView()
    }
}
