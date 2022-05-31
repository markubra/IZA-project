//
//  LocationManager.swift
//  WeatherApp
//
//  Created by Marko Kubrachenko on 25.05.2022.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject {
    private let manager = CLLocationManager()
    @Published var userLocation: CLLocation?
    static let shared = LocationManager()
    
    override init() {
        super.init()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func requestLocation() {
        manager.requestWhenInUseAuthorization()
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
            case .notDetermined:
                print("DEBUG: Not Determined")
            case .restricted:
                print("DEBUG: Restricted")
            case .denied:
                print("DEBUG: Denied")
            case .authorizedAlways:
                print("DEBUG: Authorized Always")
            case .authorizedWhenInUse:
                print("DEBUG: Authorized When In Use")
            case .authorized:
                print("DEBUG: Authorized")
            @unknown default:
                break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.userLocation = location
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error Getting a Location: \(error)")
    }
}
