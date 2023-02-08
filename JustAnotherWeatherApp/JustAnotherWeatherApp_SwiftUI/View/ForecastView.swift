//
//  ForecastView.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import SwiftUI

struct ForecastView: View {
    @ObservedObject var api: WeatherAPI
    
    var body: some View {
        HStack {
            Text("\(api.weatherUI.humidity)%")
                .padding(.leading, 20)
                .foregroundColor(.white)
            Text("Humidity")
                .foregroundColor(.white)
            
            Spacer()
                       
            Text("\(api.weatherUI.wind)km/h")
                .foregroundColor(.white)
            Text("Wind")
                .padding(.trailing, 20)
                .foregroundColor(.white)
        }
    }
}

struct ForecastView_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView(api: WeatherAPI())
    }
}
