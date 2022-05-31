//
//  LoadingView.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 27.05.2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
