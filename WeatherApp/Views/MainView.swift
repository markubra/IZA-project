//
//  MainView.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 22.05.2022.
//

import SwiftUI

struct MainView: View {
    @State private var selection = 1
    
    var body: some View {
            TabView(selection: $selection) {
                CurrentLocationView()
                    .tabItem {
                        VStack {
                            Image(systemName: "location.north.circle")
                            Text("Current Location")
                        }
                    }
                    .tag(1)
                FavoriteLocationsListView()
                    .tabItem {
                        VStack {
                            Image(systemName: "heart.circle")
                            Text("Favorite Locations")
                        }
                    }
                    .tag(2)
            }
            .accentColor(Color(.black))
            .preferredColorScheme(.dark)
    }
}
