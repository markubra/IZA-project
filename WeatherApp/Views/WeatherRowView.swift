//
//  WeatherRowView.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 26.05.2022.
//

import SwiftUI

struct WeatherRowView: View {
    var logo: String
    var name: String
    var value: String
    
    var body: some View {
        HStack(spacing: 20) {
            Button(action: {}, label: {
                Image(systemName: logo)
                    .font(.title2)
                    .frame(width: 20, height: 20)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(50)
            })
            .buttonStyle(ScaleButtonStyle())
            
            VStack(alignment: .leading, spacing: 8) {
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct ScaleButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 2 : 1)
    }
}
