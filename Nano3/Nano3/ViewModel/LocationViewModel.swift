//
//  LocationViewModel.swift
//  Nano3
//
//  Created by Andrew Oroh on 13/07/24.
//

import Foundation
import CoreLocation

class LocationViewModel:LocationManagerDelegate, ObservableObject{
   
   @Published var currentUserLocation : CLLocation?
   @Published var cityName : String = "no city"
   
   private let locationServiceManager = LocationServiceManager.shared
   
   init(){
      locationServiceManager.delegate = self
   }
   
   func didUpdateLocation(_ location: CLLocation) {
      self.currentUserLocation = location
   }
   
   func getCityName(_ cityName: String) {
      self.cityName = cityName
   }
}
