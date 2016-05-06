//
//  ViewController.swift
//  Where Am I
//
//  Created by Yisen on 6/19/15.
//  Copyright (c) 2015 Yisen. All rights reserved.
//

import UIKit
import CoreLocation


class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    var manager:CLLocationManager!

    @IBOutlet weak var latitude: UILabel!
    @IBOutlet weak var longitude: UILabel!
    @IBOutlet weak var currentSpeed: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var currentTimeZone: UILabel!
    @IBOutlet weak var altitude: UILabel!
    @IBOutlet weak var nearestAddress: UILabel!
    @IBOutlet weak var courseLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy - kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        

    }
    
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        println(locations)
        
        var userLocation:CLLocation = locations[0] as! CLLocation
        
        self.latitude.text = "\(userLocation.coordinate.latitude)"
        self.longitude.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.currentSpeed.text = "\(userLocation.speed)"
        self.altitude.text = "\(userLocation.altitude)"
        
        self.currentTime.text = "\(userLocation.timestamp)"
        
        
        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler: { (placemarks, error) -> Void in
            if (error != nil) {
                println(error)
                
                
            } else {
                if let p = CLPlacemark(placemark: placemarks?[0] as! CLPlacemark) {
                    self.nearestAddress.text = "\(p.thoroughfare), \(p.subAdministrativeArea), \(p.country)"
                    
                   
                    
                }
                
                
            }
        })
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

        
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

