import Foundation

struct Product {
    
    let id: String
    let name: String
    let enabled: Bool
    
}

struct Partner {
    
    let distance: String
    let name: String
    let id: String
    let products: [Product]
    let logo: String
    
}

struct AttendanceValidationType {
    
    let type: String
    let info: String
    
}

struct AttendanceProduct {
    
    let id: String
    let name: String
    
}


struct AttendancePartner {
    
    let name: String
    let id: String
    let product: AttendanceProduct
    let logo: String
    
}


struct Attendance {
    
    let partner: AttendancePartner
    let date: String
    let validation: AttendanceValidationType
    
}
