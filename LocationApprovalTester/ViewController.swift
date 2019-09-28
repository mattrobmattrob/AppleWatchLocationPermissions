//
//  ViewController.swift
//  LocationApprovalTester
//
//  Created by Matt Robinson on 9/26/19.
//  Copyright © 2019 Strava. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var locationAuthLabel: UILabel!
    @IBOutlet weak var lastLocationLabel: UILabel!

    private let locationManager = CLLocationManager.init()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)

        locationManager.delegate = self
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        locationManager.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationAuthLabel.text = CLLocationManager.authorizationStatus().displayLabel()
        lastLocationLabel.text = "No location"
    }

    @IBAction func requestWhenInUseAuth() {
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.requestWhenInUseAuthorization()
    }

    @IBAction func startUpdatingLocation() {
        locationManager.startUpdatingLocation()
    }

    // MARK: CLLocationManagerDelegate

    func locationManager(_ manager: CLLocationManager,
                         didChangeAuthorization status: CLAuthorizationStatus) {
        locationAuthLabel.text = status.displayLabel()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)

        lastLocationLabel.text = "\(Date().timeIntervalSince1970)"
    }
}

