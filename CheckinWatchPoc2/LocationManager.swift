import Foundation
import MapKit

class Locationmanager: NSObject, ObservableObject {
    
    static let shared = Locationmanager()
    
    private let locationManager = CLLocationManager()
    private var locationListeners: [LocationListener] = []
    
    @Published var location: CLLocation? = nil
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = kCLHeadingFilterNone
    }
    
    func start() {
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    func addListener(listener: LocationListener) {
        self.locationListeners.append(listener)
    }
    
    func hasPermission() -> Bool {
        var hasPermission = false
        if CLLocationManager.locationServicesEnabled() {
            switch CLLocationManager.authorizationStatus() { // <= 'authorizationStatus()' was deprecated in iOS 14.0
            case .notDetermined, .restricted, .denied:
                hasPermission = false
            case .authorizedAlways, .authorizedWhenInUse:
                hasPermission = true
            @unknown default:
                hasPermission = false
              }
        } else {
             hasPermission = false
        }
        return hasPermission
    }
    
}

extension Locationmanager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else {
            return
        }
        print("UPDATED")
        for listener in self.locationListeners {
            listener.onLocationUpdate(location: location)
        }
        
        self.location = location
    }
    
}

protocol LocationListener {
    
    func onLocationUpdate(location: CLLocation)
    
}
