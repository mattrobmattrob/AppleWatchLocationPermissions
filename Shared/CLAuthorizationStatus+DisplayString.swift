//
//  CLAuthorizationStatus+DisplayString.swift
//  LocationApprovalTester
//
//  Created by Matt Robinson on 9/26/19.
//  Copyright © 2019 Strava. All rights reserved.
//

import CoreLocation

extension CLAuthorizationStatus {
    func displayLabel() -> String {
        switch self {
        case .authorizedAlways:
            return "authorizedAlways"
        case .authorizedWhenInUse:
            return "authorizedWhenInUse"
        case .denied:
            return "denied"
        case .notDetermined:
            return "notDetermined"
        case .restricted:
            return "restricted"
        @unknown default:
            fatalError()
        }
    }
}
