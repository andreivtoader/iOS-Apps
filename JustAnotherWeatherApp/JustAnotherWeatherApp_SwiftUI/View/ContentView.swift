//
//  ContentView.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherAPI = WeatherAPI()
    
    var body: some View {
        VStack {
            SearchBarView(api: weatherAPI)
                .padding(.bottom, 30)
            DateView()
            
            HorizontalLineView()
            Spacer()
            
            TemperatureView(api: weatherAPI)
            
            Spacer()
            HorizontalLineView()
                .padding(.bottom, 30)
            
            ForecastView(api: weatherAPI)

            Spacer()
        }
        .padding()
        .background(BackgroundColor.matteBlack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
