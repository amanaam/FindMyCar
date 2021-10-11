//
//  MapViewController.swift
//  FindMyCar
//
//  Created by Abdul Manaam on 9/30/21.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
  @IBOutlet var mapView: MKMapView!
  let location = Location()

    override func viewDidLoad() {
      super.viewDidLoad()
      location.loadLocation()
      let initialLocation = CLLocation(latitude: location.latitude, longitude: location.longitude)
      centerMapOnLocation(location: initialLocation)
      dropPin(title: "You Are Here", subtitle: "Look it's you!")
    }
    
  let regionRadius: CLLocationDistance = 400
  
  func dropPin(title: String, subtitle: String){
    let droppedPin = MKPointAnnotation()
    droppedPin.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
    droppedPin.title = title
    droppedPin.subtitle = subtitle
    mapView.addAnnotation(droppedPin)
  }

  func centerMapOnLocation(location: CLLocation) {
    let coordinateRegion = MKCoordinateRegion(center: location.coordinate, latitudinalMeters: regionRadius * 2.0, longitudinalMeters: regionRadius * 2.0)
    mapView.setRegion(coordinateRegion, animated: true)
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
