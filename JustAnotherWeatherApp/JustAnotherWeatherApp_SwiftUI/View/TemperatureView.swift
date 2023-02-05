//
//  TemperatureView.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import SwiftUI

struct TemperatureView: View {
    @ObservedObject var api: WeatherAPI
    var body: some View {
        VStack {
            Text("\(api.weatherUI.temperature)°C")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .font(.system(size: 69))
                .fontWeight(.bold)
                .foregroundColor(.black)
            Text("\(api.weatherUI.description)")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .font(.system(size: 35))
                .fontWeight(.medium)
                .foregroundColor(.black)
        }
    }
}

struct TemperatureView_Previews: PreviewProvider {
    static var previews: some View {
        TemperatureView(api: WeatherAPI())
    }
}
