//
//  MapViewController.swift
//  Leisure
//
//  Created by Дмитрий Куликов on 25.04.2021.
//  
//

import UIKit
import MapKit

final class MapViewController: UIViewController, MKMapViewDelegate {
	private let output: MapViewOutput
    private let mapView = MKMapView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height))
    
    let initialLocation = CLLocation(latitude: 55.751244, longitude: 37.618423)

    init(output: MapViewOutput) {
        self.output = output

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()
        mapView.centerToLocation(initialLocation)
        mapView.delegate = self
        
        view.addSubview(mapView)
        output.didLoadView()
	}
}

extension MapViewController: MapViewInput {
    func reloadData() {
        self.mapView.removeAnnotations(self.mapView.annotations)
        self.mapView.addAnnotations(output.mapPlaces)
    }
}

private extension MKMapView {
  func centerToLocation(
    _ location: CLLocation,
    regionRadius: CLLocationDistance = 10000
  ) {
    let coordinateRegion = MKCoordinateRegion(
      center: location.coordinate,
      latitudinalMeters: regionRadius,
      longitudinalMeters: regionRadius)
    setRegion(coordinateRegion, animated: true)
  }
}

extension MapViewController {
  func mapView(
    _ mapView: MKMapView,
    viewFor annotation: MKAnnotation
  ) -> MKAnnotationView? {
    guard let annotation = annotation as? MapPlace else {
      return nil
    }
   
    let identifier = "place"
    var view: MKMarkerAnnotationView
    
    if let dequeuedView = mapView.dequeueReusableAnnotationView(
      withIdentifier: identifier) as? MKMarkerAnnotationView {
      dequeuedView.annotation = annotation
      view = dequeuedView
    } else {
      
      view = MKMarkerAnnotationView(
        annotation: annotation,
        reuseIdentifier: identifier)
      view.canShowCallout = true
      view.calloutOffset = CGPoint(x: -5, y: 5)
      view.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
    }
    return view
  }
}
