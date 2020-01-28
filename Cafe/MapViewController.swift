//
//  MapViewController.swift
//  Cafe
//
//  Created by Карина Паланчук on 28/01/2020.
//  Copyright © 2020 Karina Palanchuk. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    var cafe: Cafe!
    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(cafe.location) { (placemarks, error) in
            guard error == nil else { return }
            guard let placemarks = placemarks else { return }
            
            let placemark = placemarks.first!
            
            let annotation = MKPointAnnotation()
            annotation.title = self.cafe.name
            annotation.subtitle = self.cafe.type
            
            guard let location = placemark.location else { return }
            annotation.coordinate = location.coordinate
            
            self.mapView.showAnnotations([annotation], animated: true)
            self.mapView.selectAnnotation(annotation, animated: true)
            
            
        }
      
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
