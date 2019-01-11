//
//  ViewControllerRutaJefeCobranza.swift
//  Actividad1
//
//  Created by usuario on 1/9/19.
//  Copyright © 2019 wenceslao. All rights reserved.
//

import UIKit
import MapKit

class ViewControllerRutaJefeCobranza: UIViewController {

    @IBOutlet weak var lblNotas: UILabel!
    @IBOutlet weak var lblTiempo: UILabel!
    @IBOutlet weak var lblAdeudo: UILabel!
    @IBOutlet weak var lblPersona: UILabel!
    @IBOutlet weak var lblCodigoPostal: UILabel!
    @IBOutlet weak var lblDireccion: UILabel!
    @IBOutlet weak var lblDelegacion: UILabel!
    @IBOutlet weak var map: MKMapView!
    var numeroEmpleado = 0
//        var accesos: [String:String] = ["wenceslao@gmail.com":"1234"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("llega este valor \(numeroEmpleado)")
        
        // Do any additional setup after loading the view.
        map.delegate = self
        
        //        MARK: DIBUJAR MAPA
        // Do any additional setup after loading the view, typically from a nib.
        var latitude: CLLocationDegrees
        var longitude: CLLocationDegrees
        var latDelta: CLLocationDegrees
        var lonDelta: CLLocationDegrees
        var latitudeDes: CLLocationDegrees
        var longitudeDes: CLLocationDegrees
       
        switch numeroEmpleado {
        case 684276:
             latitude = 19.4336523
             longitude = -99.1454316
             latDelta = 0.5
             lonDelta = 0.5
             latitudeDes = 19.3948
             longitudeDes = -99.1736
             lblAdeudo.text = "100"
             lblPersona.text = "Juana"
            
        case 684277:
            latitude = 19.4336423
            longitude = -99.1691376
            latDelta = 0.5
            lonDelta = 0.5
            latitudeDes = 19.2660591
            longitudeDes = -99.1454416
            lblAdeudo.text = "150"
            lblPersona.text = "Pedro"
        case 684278:
            latitude = 19.4336423
            longitude = -99.1691396
            latDelta = 0.5
            lonDelta = 0.5
            latitudeDes = 19.2660601
            longitudeDes = -99.1454426
            lblAdeudo.text = "50"
            lblPersona.text = "Camila"
        case 684279:
            latitude = 19.4691921
            longitude = -99.0580106
            latDelta = 0.5
            lonDelta = 0.5
            latitudeDes = 19.5090064
            longitudeDes = -98.9212414
            lblAdeudo.text = "200"
            lblPersona.text = "Isabela"
           
            
        default:
            latitude = 19.4336523
            longitude = -99.1454316
            latDelta = 0.5
            lonDelta = 0.5
            latitudeDes = 19.3948
            longitudeDes = -99.1736
        }
        
        let span = MKCoordinateSpan(latitudeDelta: latDelta, longitudeDelta: lonDelta)
        let coordinates = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: coordinates, span: span)
        map.setRegion(region, animated: true)
        
        //        MARK : ANOTACIONES
        
        let annotation = MKPointAnnotation()
        annotation.title = "Ciudad de México"
        annotation.subtitle = "Me encuentro aqui."
        annotation.coordinate = coordinates
        map.addAnnotation(annotation)
        map.selectAnnotation(annotation, animated: true)
        
        // 19.3948,-99.1736
        let coordinates2 = CLLocationCoordinate2D(latitude:latitudeDes, longitude:longitudeDes)
        //        MARK: RUTA
        
        let sourcePlacemark = MKPlacemark.init(coordinate: coordinates)
        let sourceMapItem = MKMapItem.init(placemark: sourcePlacemark)
        
        let destinationPlacemark = MKPlacemark.init(coordinate: coordinates2)
        let destinationMapItem = MKMapItem.init(placemark: destinationPlacemark)
        
        //        MARK: OBTENER DIRECCIONES
        let geocoder = CLGeocoder()
        
        //obtener a traves de un CLLocation
        geocoder.reverseGeocodeLocation(CLLocation(latitude: coordinates2.latitude, longitude: coordinates2.longitude)){(placemarks, error) in
            if error != nil{
                print(error)
            }
            if let placemark = placemarks{
                print(placemark[0].name)
                print(placemark[0].administrativeArea)
                print(placemark[0].postalCode)
                print(placemark[0].timeZone)
                print(placemark[0].country)
                print(placemark[0].locality)
                print(placemark[0].areasOfInterest)
                print(placemark[0].subAdministrativeArea)
            self.lblDireccion.text = placemark[0].name
            self.lblCodigoPostal.text = placemark[0].postalCode
            self.lblDelegacion.text = placemark[0].subAdministrativeArea
            }
        }
        
        let directionRequest = MKDirections.Request()
        directionRequest.source = sourceMapItem
        directionRequest.destination = destinationMapItem
        directionRequest.transportType = .automobile
        
        let directions = MKDirections(request: directionRequest)
        directions.calculate {
            (response, error) -> Void in
            guard let response = response else {
                if let error = error {
                    print("Error: \(error)")
                }
                return
            }
            let route = response.routes[0]
            print(response.routes[0])
            print("tiempo estimado" + "\(response.routes[0].expectedTravelTime)")
            self.lblTiempo.text = String(response.routes[0].expectedTravelTime)
            self.map.addOverlay(route.polyline, level: .aboveRoads)
            let rect = route.polyline.boundingMapRect
            self.map.setRegion(MKCoordinateRegion(rect), animated: true)
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
extension ViewControllerRutaJefeCobranza: MKMapViewDelegate{
    public func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineDashPattern = [4,2];
        renderer.lineWidth = 4.0
        renderer.alpha = 1
        return renderer
    }
}
