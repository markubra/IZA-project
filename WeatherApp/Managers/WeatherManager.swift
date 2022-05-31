//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 25.05.2022.
//

import CoreLocation

class WeatherManager {
    let API_KEY = "df6351d5e0789425dd1319b05651c9fa"
    
    enum RequestType {
        case cityName(city: String)
        case coordinate(latitude: CLLocationDegrees, longitude: CLLocationDegrees)
    }
    
    enum WeatherManagerError: Error {
        case invalidLocationName
        case notLatinSymbols
    }
    
    func getCurrentWeather(requestType: RequestType) async throws -> ResponseBody {
        var urlString = ""
        
        switch requestType {
        case .cityName(var city):
            city = city.split(separator: " ").joined(separator: "%20")
            urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&apikey=\(API_KEY)&units=metric"
        case .coordinate(let latitude, let longitude):
            urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&apikey=\(API_KEY)&units=metric"
        }
    
        guard let url = URL(string: urlString) else { throw WeatherManagerError.invalidLocationName }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw WeatherManagerError.invalidLocationName }
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
    
        return decodedData
    }
}
