//
//  InterfaceController.swift
//  Companion Extension
//
//  Created by Matt Robinson on 9/26/19.
//  Copyright © 2019 Strava. All rights reserved.
//

import WatchKit
import Foundation
import CoreLocation

class InterfaceController: WKInterfaceController, CLLocationManagerDelegate {

    @IBOutlet weak var locationAuthLabel: WKInterfaceLabel!
    @IBOutlet weak var lastLocationLabel: WKInterfaceLabel!

    private let locationManager = CLLocationManager.init()

    override init() {
        super.init()

        locationManager.delegate = self
    }
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        locationAuthLabel.setText(CLLocationManager.authorizationStatus().displayLabel())
        lastLocationLabel.setText("No locations")
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    @IBAction func requestWhenInUse() {
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.requestWhenInUseAuthorization()
    }

    @IBAction func startLocationUpdates() {
        locationManager.startUpdatingLocation()
    }

    // MARK: CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        locationAuthLabel.setText(status.displayLabel())
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)

        lastLocationLabel.setText("\(Date().timeIntervalSince1970)")
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
}
