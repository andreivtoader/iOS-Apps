//
//  DateView.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import SwiftUI

struct DateView: View {
    var body: some View {
        VStack {
            Text(Date().dayOfWeek()!)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("\(Date().dayOfMonth()!) \(Date().monthOfYear()!)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
        }
        .background(BackgroundColor.matteBlack)
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}
