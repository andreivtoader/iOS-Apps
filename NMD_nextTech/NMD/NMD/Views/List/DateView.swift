//
//  DateView.swift
//  NMD
//
//  Created by Andrei Toader on 13.08.2023.
//

import SwiftUI

struct DateView: View {
    let description: String
    
    var body: some View {
        HStack {
            Text(description)
                .font(.system(size: 15))
                .foregroundColor(.gray)
            Spacer()
        }
        .padding(.vertical, 3)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView(description: "Jan 20, 2023")
    }
}
