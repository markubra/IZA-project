//
//  WeatherView.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 25.05.2022.
//

import SwiftUI

struct WeatherView: View {
    var weather: Weather
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                HStack {
                    VStack(alignment: .leading, spacing: 5) {
                        Text(weather.locationName)
                            .bold()
                            .font(.system(size: 50))
                        
                        Text("Today")
                            .bold()
                    }
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        Image(systemName: weather.selectIcon())
                            .font(.system(size: 40))
                        
                        Text(weather.description)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                    .frame(height: 5)
                
                VStack(spacing: 5) {
                    Text(weather.temperature)
                        .font(.system(size: 100))
                        .fontWeight(.bold)

                    Text("Feels like \(weather.feelsLikeTemperature)")
                        .font(.system(size: 20))
                }
                .frame(maxWidth: .infinity)
                
                Spacer()
                
                ZStack {
                    Color.white
                        .opacity(0.4)
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                        .ignoresSafeArea()
                    
                    VStack {
                        HStack {
                            WeatherRowView(logo: "thermometer", name: "Min temp", value: weather.minimumTemperature)
                            
                            Spacer()
                            
                            WeatherRowView(logo: "thermometer", name: "Max temp", value: weather.maximumTemperature)
                        }
                        
                        Spacer()
                            .frame(height: 40)
                            
                        HStack {
                            WeatherRowView(logo: "wind", name: "Wind speed", value: weather.windSpeed)
                            
                            Spacer()
                            
                            WeatherRowView(logo: "humidity", name: "Humidity", value: weather.humidity)
                        }
                    }
                    .padding()
                    .foregroundColor(Color.black)
                    .padding(.bottom, 100)
                }
                .frame(height: 150)
            }
        }
        .foregroundColor(Color.white)
    }
}
