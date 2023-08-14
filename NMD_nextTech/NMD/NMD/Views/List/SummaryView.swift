//
//  SummaryView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct SummaryView: View {
    var description: String
    var truncated: Bool
    
    var body: some View {
        HStack {
            if truncated {
                Text(description)
                    .font(.system(size: 15, weight: .semibold))
                    .lineLimit(1)
                    .truncationMode(.tail)
            } else {
                Text(description)
                    .font(.system(size: 15, weight: .semibold))
            }
                
            Spacer()
        }
        .padding(.vertical, 3)
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        SummaryView(description: "Inner motivation for everything.", truncated: true)
    }
}
