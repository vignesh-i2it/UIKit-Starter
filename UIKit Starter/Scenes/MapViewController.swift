//
//  MapViewController.swift
//  UIKit Starter
//
//  Created by Vignesh on 21/07/23.
//

import Foundation
import UIKit
import MapKit

class MapViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()

        let initialLocation = CLLocation(latitude: 13.0827, longitude: 80.2707)
        mapView.centerToLocation(initialLocation)

        setupLocationButton()
    }

    private func setupLocationManager() {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestWhenInUseAuthorization()

            mapView.showsUserLocation = true

            let locationButton = MKUserTrackingButton(mapView: mapView)
            mapView.addSubview(locationButton)
            locationButton.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                locationButton.trailingAnchor.constraint(equalTo: mapView.trailingAnchor, constant: -16),
                locationButton.bottomAnchor.constraint(equalTo: mapView.bottomAnchor, constant: -16)
            ])
        }
    
    private func setupLocationButton() {
            let locationButton = MKUserTrackingButton(mapView: mapView)
            locationButton.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(locationButton)

            let buttonPadding: CGFloat = 16
            NSLayoutConstraint.activate([
                locationButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -buttonPadding),
                locationButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -buttonPadding)
            ])
        }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            mapView.showsUserLocation = (status == .authorizedWhenInUse || status == .authorizedAlways)
        }
    
    private func setupMapView() {
        mapView.delegate = self
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
}

private extension MKMapView {
  func centerToLocation(_ location: CLLocation, regionRadius: CLLocationDistance = 1000) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}
