//
//  WelcomeView.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 27.05.2022.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .blur(radius: 8, opaque: true)
            
            VStack {
                VStack(spacing: 20) {
                    Text("Hello!")
                        .bold()
                        .font(.title)
                    
                    Text("Please share your current location to get the weather in your area.")
                        .padding()
                }
                .multilineTextAlignment(.center)
                .padding()
                
                LocationButton(.shareCurrentLocation) {
                    locationManager.requestLocation()
                }
                .cornerRadius(30)
                .symbolVariant(.fill)
                .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(Color(.white))
            .accentColor(Color(.white))
        }
    }
}
