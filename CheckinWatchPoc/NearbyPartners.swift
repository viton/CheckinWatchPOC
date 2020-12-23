import Foundation
import MapKit

struct NearbyPartners {
    
    func getNearbyPartners(latitude: Double, longitude: Double) -> [Partner] {
        let products: [Product] = [
            Product(id: "1", name: "Swimming", enabled: true),
            Product(id: "2", name: "Golf Class", enabled: false)
        ]
        
        let partners = [
            Partner(distance: "290 m", name: "Premium Parnter", id: "1", products: products, logo: "https://www.benessegestaoesportiva.com.br/images/condominios/golfe-fitness.jpg")
        ]
        
        return partners
    }
    
}
