//
//  CurrentLocationView.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 25.05.2022.
//

import SwiftUI

struct CurrentLocationView: View {
    @ObservedObject var locationManager = LocationManager.shared
    var weatherManager = WeatherManager()
    @State var response: ResponseBody?
    
    var body: some View {
        Group {
            if let location = locationManager.userLocation {
                if let response = response {
                    WeatherView(weather: Weather(responseModel: response))
                } else {
                    LoadingView()
                        .task {
                            do {
                                response = try await weatherManager.getCurrentWeather(requestType: .coordinate(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude))
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } else {
                WelcomeView()
                    .environmentObject(locationManager)
            }
        }
    }
}
