//
//  SearchBarView.swift
//  JustAnotherWeatherApp_SwiftUI
//
//  Created by Andrei Toader on 04.02.2023.
//

import SwiftUI

struct SearchBarView: View {
    @ObservedObject var api: WeatherAPI
    @Environment(\.scenePhase)  private var scenePhase
    
    @State private var show = false
    @State private var currentCityName = ""
    @State private var textfieldText = ""
    @State private var firstRequest = true
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                if !self.show {
                    Text(api.weatherUI.cityName)
                        .fontWeight(.bold)
                        .font(.title)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                HStack {
                    if self.show {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                        
                        TextField("", text: self.$textfieldText, prompt: Text("Search City").foregroundColor(.white))
                            .foregroundColor(.white)
                            .onSubmit {
                                currentCityName = textfieldText
                                textfieldText = ""
                                Task {
                                    try await api.getWeatherAsync(for: currentCityName)
                                    api.weatherUI.cityName = currentCityName
                                }
                                self.show.toggle()
                            }
                        
                        Button {
                            withAnimation(.easeInOut) {
                                currentCityName = api.weatherUI.cityName
                                self.show.toggle()
                            }
                        } label: {
                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                        }
                        .padding(.horizontal, 8)
                    } else {
                        Button {
                            withAnimation(.easeInOut) {
                                currentCityName = api.weatherUI.cityName
                                self.show.toggle()
                            }
                            
                        } label: {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .padding(10)
                        }
                        .padding(.horizontal, 8)
                    }
                }
                .padding(self.show ? 10: 0)
                .cornerRadius(20)
            }
            .padding(.horizontal)
            .padding(.bottom, 10)
        }
        .background(BackgroundColor.matteBlack)
        .onChange(of: scenePhase) { newPhase in
            switch newPhase {
            case .active:
                print("scene is now active")
                Task {
                    try await api.getInitialWeatherAsync()
                }
            case .inactive:
                print("scene is now inactive")
            case .background:
                print("scene is now in the background")
            @unknown default:
                print("Apple must have added something new")
            }
        }
    }
}

//struct SearchBarView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchBarView(api: WeatherAPI())
//    }
//}

