//
//  LocationServiceManager.swift
//  Nano3
//
//  Created by Andrew Oroh on 13/07/24.
//

import Foundation
import CoreLocation

class LocationServiceManager : NSObject,CLLocationManagerDelegate{
    static let shared = LocationServiceManager()
    
    private let locationManager = CLLocationManager()
    
    weak var delegate: LocationManagerDelegate?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = CLLocationDistance(50)
        locationManager.startUpdatingLocation()
        locationManager.startUpdatingHeading()
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        switch manager.authorizationStatus{
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            manager.stopUpdatingLocation()
        case .authorizedWhenInUse, .authorizedAlways:
            manager.startUpdatingLocation()
        @unknown default:
            print("Unknown location authorization status")
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            delegate?.didUpdateLocation(lastLocation)
            
            var cityName = "no cityName"
            
            let geoCoder = CLGeocoder()

            geoCoder.reverseGeocodeLocation(lastLocation) { placemarks, _ in
                guard let placemark = placemarks?.first else { return }
                print(placemark.locality)
                cityName = placemark.locality ?? "error cityName"
                self.delegate?.getCityName(cityName)
            }
        }
    }
    
    func getCityName(location: CLLocation){
    }

}
