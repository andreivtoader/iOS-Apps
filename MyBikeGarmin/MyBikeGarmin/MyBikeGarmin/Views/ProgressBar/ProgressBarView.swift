//
//  ProgressBarView.swift
//  MyBikeGarmin
//
//  Created by Andrei Toader on 05.06.2023.
//

import SwiftUI

// Percentage as values from 0...1
struct ProgressBarView: View {
    var percentage: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                Image("loading_bar")
                    .resizable()
                    .frame(width: geometry.size.width , height: geometry.size.height)
                    
                
                Image("loading_over")
                    .resizable()
                    .frame(width: min(CGFloat(percentage)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                
                Image("loading_circle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height*3, alignment: .leading)
                
                Image("loading_bolt")
                    .resizable()
                    .scaledToFit()
                    .frame(width: geometry.size.width, height: geometry.size.height*3, alignment: .trailing)
                
                Image("loading_wrench")
                    .resizable()
                    .scaledToFit()
                    .padding(.leading, min(CGFloat(percentage)*geometry.size.width, geometry.size.width))
            }
        }
        .frame(height: 5)
    }
}

struct ProgressBarView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(percentage: 0.25)
    }
}
