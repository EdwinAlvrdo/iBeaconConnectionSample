//
//  ViewController.swift
//  pagodirecto
//
//  Created by Edwin Alvarado on 3/6/18.
//  Copyright © 2018 Edwin Alvarado. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
 
    let locationManager = CLLocationManager()
    let region = CLBeaconRegion(proximityUUID: NSUUID(uuidString: "B9407F30-F5F8-466E-AFF9-25556B57FE6D")! as UUID, identifier: "Estimotes")
    
    let colors = [
        26088: UIColor(red: 152/255, green: 251/255, blue: 152/255, alpha: 1),
        40042: UIColor(red: 69/255, green: 8/255, blue: 135/255, alpha: 1)
        //26088: UIColor(red: 152/255, green: 251/255, blue: 152/255, alpha: 1)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locationManager.delegate = self
        if (CLLocationManager.authorizationStatus() != CLAuthorizationStatus.authorizedWhenInUse){
            locationManager.requestWhenInUseAuthorization() //Just use for test
        }
        
        locationManager.startRangingBeacons(in: region)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }
    
    func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
        //print(beacons)
        
        let knownBeacons = beacons.filter{ $0.proximity != CLProximity.unknown }
        if (knownBeacons.count > 0){
            let closestBeacon = knownBeacons[0] as CLBeacon
            self.view.backgroundColor = self.colors[closestBeacon.minor.intValue]
        }
    }


}

