//
//  ViewController.swift
//  WorkWithMapKit
//
//  Created by Orest Mykha on 12/9/16.
//  Copyright © 2016 Orest Mykha. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!

    let regionRadius: CLLocationDistance = 1000
    var artworks = [Artwork]()
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapView.delegate = self
        
        let initialLocation = CLLocation(latitude: 21.282778, longitude: -157.829444)
        centerMapOfLocation(location: initialLocation)
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(initialLocation) { (placemark, error) in
            var placemarks = placemark as [CLPlacemark]!
            let place:CLPlacemark!
            place = placemarks?[0]
            print(place.addressDictionary)
        }
        
        // show artWork on Map
        
        /*
        let artWork = Artwork(title: "King David Kalakaua", locationName: "Waikiki Gateway Park", discipline: "Sculpture", coordinate: CLLocationCoordinate2D(latitude: 21.282778, longitude: -157.829444))
        
        mapView.addAnnotation(artWork)
        */
        
        loadInitialData()
        mapView.addAnnotations(artworks)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        checkLocationAuthorizationStatus()
    }
    
    // MARK: - location manager to authorize user location for Maps app
    func checkLocationAuthorizationStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }

    func centerMapOfLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func loadInitialData() {
        // 1
        let fileName = Bundle.main.path(forResource: "PublicArt", ofType: "json")
        var data: Data?
        do {
            data = try Data(contentsOf: URL(fileURLWithPath: fileName!), options: NSData.ReadingOptions(rawValue: 0))
        } catch _ {
            data = nil
        }
        
        // 2
        var jsonObject: Any? = nil
        if let data = data {
            do {
                jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))
            } catch _ {
                jsonObject = nil
            }
        }
        
        // 3
        if let jsonObject = jsonObject as? [String: Any],
            // 4
            let jsonData = JSONValue.fromObject(object: jsonObject as AnyObject)?["data"]?.array {
            for artworkJSON in jsonData {
                if let artworkJSON = artworkJSON.array,
                    // 5
                    let artwork = Artwork.fromJSON(artworkJSON) {
                    artworks.append(artwork)
                }
            }
        }
    }

}

