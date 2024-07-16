//
//  LocationManagerDelegate.swift
//  Nano3
//
//  Created by Andrew Oroh on 13/07/24.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate : AnyObject{
    func didUpdateLocation(_ location:CLLocation)
}

