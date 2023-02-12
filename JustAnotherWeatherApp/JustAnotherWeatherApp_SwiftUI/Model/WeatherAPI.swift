//
//  WeatherAPI.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import Foundation

class WeatherAPI: ObservableObject {
    
    @Published var weatherUI = WeatherUI()
    
    private let currentLocation = CurrentLocation()
    
    func getInitialWeatherAsync() async throws {
        guard let url = WeatherEndpoint(latitude: currentLocation.latitude, longitude: currentLocation.longitude).url else {
            print("Could not create the WeatherEndpoint url...")
            return
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let weatherJSON = try JSONDecoder().decode(WeatherJSON.self, from: data)
        
        publishWeatherResults(weather: weatherJSON, updateCityName: true)
    }
    
    func getWeatherAsync(for cityName: String) async throws {
        let cities = try await searchCityGeocodeAsync(cityName: cityName)
        guard let url = WeatherEndpoint(latitude: cities.first?.lat ?? 0.0, longitude: cities.first?.lon ?? 0.0).url else {
            print("Could not create the WeatherEndpoint url...")
            return
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let weatherJSON = try JSONDecoder().decode(WeatherJSON.self, from: data)
        
        publishWeatherResults(weather: weatherJSON, updateCityName: false)
    }
    
    private func searchCityGeocodeAsync(cityName: String) async throws -> [CityJSON] {
        guard let url = GeocodeEndpoint(cityName: cityName).url else {
            print("Could not create the GeocodeEndpoint url...")
            return []
        }
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let citiesJSON = try JSONDecoder().decode([CityJSON].self, from: data)
        
        return citiesJSON
    }
    
    private func publishWeatherResults(weather: WeatherJSON, updateCityName: Bool) {
        DispatchQueue.main.async {
            self.weatherUI.temperature = Int(weather.main.temp)
            self.weatherUI.description = weather.weather.first!.main
            self.weatherUI.humidity = weather.main.humidity
            self.weatherUI.wind = Int(weather.wind.speed)
            
            if updateCityName {
                self.weatherUI.cityName = weather.name
            }
        }
    }
}
