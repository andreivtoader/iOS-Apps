//
//  WeatherAPI.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import Foundation

class WeatherAPI: ObservableObject {
    
    @Published var weatherUI = WeatherUI()
    
    private let key = "65d1a094019093a87b527872f7725aa7"
    private let currentLocation = CurrentLocation()
    
    func getInitialWeatherAsync() async throws {
        let url = urlBasedOnLatitudeAndLongitude(latitude: currentLocation.latitude, longitude: currentLocation.longitude)
        print(url)
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let weatherJSON = try JSONDecoder().decode(WeatherJSON.self, from: data)
        
        publishWeatherResults(weather: weatherJSON, updateCityName: true)
    }
    
    func getWeatherAsync(for cityName: String) async throws {
        let cities = try await searchCityGeocodeAsync(cityName: cityName)
        let url = self.urlBasedOnLatitudeAndLongitude(latitude: cities.first?.lat ?? 0.0, longitude: cities.first?.lon ?? 0.0)
        print(url)
        
        let request = URLRequest(url: url)
        let (data, _) = try await URLSession.shared.data(for: request)
        let weatherJSON = try JSONDecoder().decode(WeatherJSON.self, from: data)
        
        publishWeatherResults(weather: weatherJSON, updateCityName: false)
    }
    
    private func urlBasedOnLatitudeAndLongitude(latitude: Double, longitude: Double) -> URL {
        let weatherURL = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&units=metric&appid=\(self.key)"
        
        return URL(string: weatherURL)!
    }
    
    private func urlBasedOnCityName(cityName: String) -> URL {
        let name = cityName.trimmingCharacters(in: .whitespacesAndNewlines)
        let geocodingURL = "https://api.openweathermap.org/geo/1.0/direct?q=\(name)&limit=1&appid=\(key)"
        
        return URL(string: geocodingURL)!
    }
    
    private func searchCityGeocodeAsync(cityName: String) async throws -> [CityJSON] {
        let url = urlBasedOnCityName(cityName: cityName)
        
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
