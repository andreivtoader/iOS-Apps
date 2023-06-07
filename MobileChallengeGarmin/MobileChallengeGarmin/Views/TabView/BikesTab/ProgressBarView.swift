//
//  ProgressBar.swift
//  MobileChallengeGarmin
//
//  Created by Andrei Toader on 03.06.2023.
//

import SwiftUI

struct ProgressBarView: View {
    let percentage: Double
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                
                Image("loading_bar")
                    .resizable()
                    .frame(width: geometry.size.width , height: geometry.size.height)
                    
                
                Image("loading_over")
                    .resizable()
                    .frame(width: min(CGFloat(self.percentage)*geometry.size.width, geometry.size.width), height: geometry.size.height)
                
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
                    .padding(.leading, min(CGFloat(self.percentage)*geometry.size.width, geometry.size.width))
            }
        }
        .frame(height: 5)
    }
}

struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBarView(percentage: 0.25)
//            .frame(height: 20)
    }
}
