//
//  MapViewController.swift
//  проэкт10мая
//
//  Created by mac os on 19.05.2019.
//  Copyright © 2019 mac os. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      //место на карте и описание к нему
        let locatiom = CLLocationCoordinate2DMake(49.53, 36.01)
        //функция приближения места на карте при загрузке
        let span = MKCoordinateSpan(latitudeDelta: 0.002, longitudeDelta: 0.002)
        let region = MKCoordinateRegion(center: locatiom, span: span)
        
        map.setRegion(region, animated: true)
        
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locatiom
        //описание места
        annotation.title = "Budy, Kharkiv Region"
        annotation.subtitle = "Welcome to myCountry"
        map.addAnnotation(annotation)
    }
    


}
