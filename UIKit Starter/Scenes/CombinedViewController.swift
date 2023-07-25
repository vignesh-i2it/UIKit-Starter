//
//  CombinedViewController.swift
//  UIKit Starter
//
//  Created by Vignesh on 25/07/23.
//
import UIKit
import WebKit
import MapKit

class CombinedViewController: UIViewController {

    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
            super.viewDidLoad()
            showMapView()
        }

    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
            switch sender.selectedSegmentIndex {
            case 0:
                showMapView()
            case 1:
                showWebView()
            default:
                break
            }
        }

        private func showMapView() {
            mapView.isHidden = false
            webView.isHidden = true

            segmentedControl.setTitle("Map", forSegmentAt: 0)
            
            let initialLocation = CLLocation(latitude: 13.0827, longitude: 80.2707)
                    mapView.centerToLocation(initialLocation)
        }

        private func showWebView() {
            mapView.isHidden = true
            webView.isHidden = false
            segmentedControl.setTitle("Web", forSegmentAt: 1)
            
            if let url = URL(string: "https://www.google.com") {
                let request = URLRequest(url: url)
                webView.load(request)
            }
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
