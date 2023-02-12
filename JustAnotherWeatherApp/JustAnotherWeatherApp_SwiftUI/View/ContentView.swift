//
//  ContentView.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var weatherAPI = WeatherAPI()
    
    // Just for demo of tab view
    let items: [Int] =  [1,2,3]
    
    var body: some View {
        VStack {
            SearchBarView(api: weatherAPI)
            
            TabView {
                // TODO: For more than current weather information, most APIs require $$$, or limit you to 50 calls per day. Sad reacts only.
                ForEach(items, id: \.self) { index in
                    VStack {
                        DateView()
                        HorizontalLineView()
                        
                        Spacer()
                        
                        TemperatureView(api: weatherAPI)
                        
                        Spacer()
                        
                        HorizontalLineView()
                        ForecastView(api: weatherAPI)
                        
                        Spacer()
                    }
                }
            }.tabViewStyle(.page)
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
