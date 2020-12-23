import Foundation
import WatchConnectivity
import MapKit

class SessionHandler: NSObject {
    
    static let shared = SessionHandler()
    private var locationManager = Locationmanager.shared
    
    private var session = WCSession.default
    
    override init() {
        super.init()
        
        if(isSupported()) {
            session.delegate = self
            session.activate()
        }
    }
    
    func isSupported() -> Bool {
        return WCSession.isSupported()
    }

}

extension SessionHandler: WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("ACTIVATION DID COMPLETE")
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        print("DID BECOME INACTIVE")
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        print("DID BECOME INACTIVE")
        self.session.activate()
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        
        print(message)
        print("I HAVE RECEIVED THE MESSAGE")
        let messageName = message["message"]! as! String
        print(messageName)
        if messageName == "getPartnersAndLocation" {
            if (self.locationManager.hasPermission()) {
                self.locationManager.addListener(listener: self)
                self.locationManager.start()
            }
            replyHandler(["message": "getPartnersAndLocation"])
        } else {
            replyHandler([
                "message": "doCheckin",
                "attendance_id": "1",
            ])
        }
        
    }
}

extension SessionHandler: LocationListener {

    func onLocationUpdate(location: CLLocation) {
        print(location)
        
        let message: [String: Any] = [
            "event": "nearby",
            "latitude": Double(location.coordinate.latitude),
            "longitude": Double(location.coordinate.longitude),
        ]
        self.session.sendMessage(message, replyHandler: { (response) in
                print("OK")
            }, errorHandler: { (error) in
                print("ERROR")
                print(error)
            }
        )
    }
    
}


