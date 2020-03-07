//
//  LocationProvider.swift
//  Speedy WatchKit Extension
//
//  Created by Bror Brurberg on 07/03/2020.
//  Copyright © 2020 Bror Brurberg. All rights reserved.
//

import Foundation
import SwiftUI

class LocationProvider: NSObject, ObservableObject {
    private var locationManager = CLLocationManager()
    private var location: CLLocation? {
        didSet {
            if let speed = location?.speed {
                set(speed: speed)
            }
            if let course = location?.course {
                set(course: course)
            }
        }
    }
    @Published var status: CLAuthorizationStatus?
    @Published var speed: Double = 0
    @Published var speedUnit: UnitSpeed = UnitSpeed.metersPerSecond
    @Published var course: String = "N/A"
    
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        
    }
    
    private func getUnit() {
        guard let unit = UserDefaults.standard.string(forKey: "unit") else {
            speedUnit = .metersPerSecond
            return
        }
        switch unit {
        case "mph":
            speedUnit = .milesPerHour
        case "km/h":
            speedUnit = .kilometersPerHour
        case "m/s":
            speedUnit = .metersPerSecond
        case "kn":
            speedUnit = .knots
        default:
            speedUnit = .metersPerSecond
        }
    }
    
    private func set(speed val: Double) {
        if val < 0 {
            speed = 0
        } else {
            let measurement = convertToMeasurement(ms: val)
            speed = measurement.value
        }
    }
    
    func set(unit: UnitSpeed) {
        UserDefaults.standard.set(unit.symbol, forKey: "unit")
        speed = Measurement(value: speed, unit: speedUnit).converted(to: unit).value
        speedUnit = unit
    }
    
    private func convertToMeasurement(ms speed: Double) -> Measurement<UnitSpeed> {
        let ms = Measurement(value: speed, unit: UnitSpeed.metersPerSecond)
        return ms.converted(to: speedUnit)
    }
    
    private func set(course val: Double) {
        if val < 0 {
            course = "N/A"
        } else {
            switch val {
            case 338...360:
                course = "N"
            case 0...22:
                course = "N"
            case 23...67:
                course = "NE"
            case 68...112:
                course = "E"
            case 112...156:
                course = "SE"
            case 157...202:
                course = "S"
            case 202...246:
                course = "SW"
            case 247...292:
                course = "W"
            case 293...337:
                course = "NW"
            default:
                course = "N/A"
            }
        }
    }
}

extension LocationProvider: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        self.status = status
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.location = location
    }
    
}
