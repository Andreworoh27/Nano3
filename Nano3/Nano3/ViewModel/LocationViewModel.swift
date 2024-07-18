//
//  LocationViewModel.swift
//  Nano3
//
//  Created by Andrew Oroh on 13/07/24.
//

import Foundation
import CoreLocation

class LocationViewModel:LocationManagerDelegate, ObservableObject{
    
    static let shared = LocationViewModel()
    
    @Published var currentUserLocation : CLLocation?
    @Published var cityName : String = "no city"
    
    private let locationServiceManager = LocationServiceManager.shared
    
    init(){
        locationServiceManager.delegate = self
    }
    
    func didUpdateLocation(_ location: CLLocation) {
        setCityName(location: location)
        self.currentUserLocation = location
    }
    
    func setCityName(location : CLLocation){
        var cityName = "no cityName"
        
        let geoCoder = CLGeocoder()
        
        geoCoder.reverseGeocodeLocation(location) { placemarks, _ in
            guard let placemark = placemarks?.first else { return }
            cityName = placemark.locality ?? "error cityName"
            self.cityName = cityName
        }
    }
}
