//
//  LocationController.swift
//  My Driving Assistant
//
//  Created by Zachary Denny on 10/22/18.
//  Copyright © 2018 Denny Homes. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


private var currentLocation: CLLocation?
//public var searchKey: String


class LocationController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate{
     var locationManager:CLLocationManager!
    
    
    @IBOutlet weak var MapView: MKMapView!
     var mapView:MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        MapView.delegate = self
//      MapView.delegate = self
        
        
        // Call for Search to start
        searchInMap()
    }
    
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        determineCurrentLocation()
    }
    
    
    func determineCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        //Set Zoom Radius parameters
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        
        MapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
//        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
//        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
//        myAnnotation.title = "Current location"
//        MapView.addAnnotation(myAnnotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print("Error \(error)")
    }
    
//Detect when pin is touched
//    func mapView(mapView: MKMapView, didSelectAnnotationView view: MKAnnotationView)
//    {
//        print("called")
//        if let annotationTitle = view.annotation?.title
//        {
//            print("User tapped on annotation with title: \(annotationTitle!)")
//        }
//    }
    
    
    func searchInMap() {
        
        //Get searchKey from other class and search it as the request
       // searchKey = getSearchKey
        
        // Search string Request
        let request = MKLocalSearch.Request()
        //request.naturalLanguageQuery = "Oil Change"
        request.naturalLanguageQuery = MapSelectorController().getSearchString()
        
        // Start Search
        let search = MKLocalSearch(request: request)
        search.start(completionHandler: {(response, error) in
            
            for item in response!.mapItems {
                self.addPinToMapView(title: item.name, latitude: item.placemark.location!.coordinate.latitude, longitude: item.placemark.location!.coordinate.longitude)
            }
        })
    }
    
    //Add Pins to locations matching search string
    func addPinToMapView(title: String?, latitude: CLLocationDegrees, longitude: CLLocationDegrees) {
//        if let title = title {
//            let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//            let annotation = MKPointAnnotation()
//            annotation.coordinate = location
//            annotation.title = title
        
            
//            if annotation is MKUserLocation { return nil }
            if #available(iOS 11.0, *) {
                
                if let title = title {
                    let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
                    let annotation = MKPointAnnotation()
                    annotation.coordinate = location
                    annotation.title = title
                
                    
                    var annotationView = MKMarkerAnnotationView()
                    //var reuseIdentifier: String? { get }
                    annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
                    
                    annotationView.canShowCallout = true
                    annotationView.rightCalloutAccessoryView = UIButton(type: .infoLight)
                    
                    
                    MapView.addAnnotation(annotation)
                }
            
                    
                    
//                var annotationView = MKMarkerAnnotationView()
//                //var reuseIdentifier: String? { get }
//                annotationView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
////                annotationView.canShowCallout = true
////                annotationView.rightCalloutAccessoryView = UIButton(type: .infoLight)
//
//                //pinView = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: reuseId)
//                annotationView.canShowCallout = true
//
//                let rightButton: AnyObject! = UIButton(type: UIButton.ButtonType.detailDisclosure)
//                annotationView.rightCalloutAccessoryView = rightButton as? UIView
//
                
                //print("called")
            } else {
                // Fallback on earlier versions
            }
          // var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "AnnotationIdentifier") as? MKPinAnnotationView
            //var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: restorationIdentifier ?? )
            
            
           
//            annotation = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
//            annotationView?.canShowCallout = true
//            annotationView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
//
//            MapView.addAnnotation(annotation)
//        }
   }
    
    
    
//    func getDirections(){
//        guard let selectedPin = selectedPin else { return }
//        let mapItem = MKMapItem(placemark: selectedPin)
//        let launchOptions = [MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving]
//        mapItem.openInMapsWithLaunchOptions(launchOptions)
//
//        print ("GET DIRECTION")
//    }
   
    func mapView(mapView: MKMapView, viewForAnnotation annotation: MKAnnotation) -> MKAnnotationView? {
       
        print("worked!")
        
        if annotation is MKUserLocation { return nil }
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: "Pin") as? MKPinAnnotationView
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "Pin")
            annotationView?.canShowCallout = true
            annotationView?.rightCalloutAccessoryView = UIButton(type: .infoLight)
        } else {
            annotationView?.annotation = annotation
        }
        
        return annotationView
    }
    
    
    
    
}

