//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 26.05.2022.
//

import Foundation

struct Weather {
    let locationName: String
    let temperature: String
    let feelsLikeTemperature: String
    let minimumTemperature: String
    let maximumTemperature: String
    let description: String
    let humidity: String
    let windSpeed: String
    let weatherIconId: Double
    
    init(responseModel: ResponseBody) {
        locationName = responseModel.name
        temperature = responseModel.main.temp.roundDouble() + "°"
        feelsLikeTemperature = responseModel.main.feelsLike.roundDouble() + "°"
        minimumTemperature = responseModel.main.tempMin.roundDouble() + "°"
        maximumTemperature = responseModel.main.tempMax.roundDouble() + "°"
        humidity = responseModel.main.humidity.roundDouble() + "%"
        windSpeed = responseModel.wind.speed.roundDouble() + " m/s"
        weatherIconId = responseModel.weather[0].id
        description = responseModel.weather[0].main
    }
    
    func selectIcon() -> String {
        switch weatherIconId {
            case 200...232: return "cloud.bolt.rain"
            case 300...321: return "cloud.drizzle"
            case 500...531: return "cloud.rain"
            case 600...622: return "cloud.snow"
            case 701...781: return "cloud.fog"
            case 800:       return "sun.min"
            case 801...804: return "cloud"
            default:        return "nosign"
        }
    }
}
