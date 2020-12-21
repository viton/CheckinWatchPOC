import Foundation
import WatchConnectivity

class ViewModelWatch: NSObject, WCSessionDelegate, ObservableObject {
    
    static let shared = ViewModelWatch()
    
    @Published var partners: [Partner]?
    @Published var attendances: [Attendance]?
    @Published var lastAttendance: Attendance?
    
    
    var session: WCSession
    
    init(session: WCSession = .default) {
        self.session = session
        super.init()
        session.delegate = self
        session.activate()
    }
    
    func isSSupported() -> Bool {
        return true
    }
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        print("ACTIVATION IS COMPLETE")
        print(session.isReachable)
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any], replyHandler: @escaping ([String : Any]) -> Void) {
        print("ALOHA, voltou")
        print(message)
        replyHandler(["status": "ok"])
        DispatchQueue.main.async {
            self.partners = NearbyPartners().getNearbyPartners(latitude: message["latitude"]! as! Double, longitude: message["longitude"]! as! Double)
        }
    }
    
    func sendMessageAndGetData() {
        if(session.isReachable) {
            let message: [String: Any] = [
                "message": "getPartnersAndLocation"
            ]
            session.sendMessage(message, replyHandler: { (response) in
                print("SUCCESS HANDLER SEND MESSAGE")
                print(response)
            }, errorHandler: { (error) in
                print("ERROR HANDLER SEND MESSAGE")
                print(error)
            })
        }
    }
    
    func sendCheckin(partner: Partner, product: Product) {
        if(session.isReachable) {
            let message: [String: Any] = [
                "message": "doCheckin",
                "product": product.id,
                "partner": partner.id
            ]
            session.sendMessage(message, replyHandler: { (response) in
                print(response)
                DispatchQueue.main.async {
                    let attendancesAPI = AttendancesAPI()
                    self.lastAttendance = attendancesAPI.getAttendance()
                    self.attendances = attendancesAPI.getAttendances()
                }
            }, errorHandler: { (error) in
                print(error)
            })
        }
    }
    
    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        print("ALOHA, voltou")
    }
}
