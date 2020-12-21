import SwiftUI

struct PartnersListView: View {
    
    let partners: [Partner]
    
    var body: some View {
        List(partners, id: \.id) { partner in
            NavigationLink(destination: PartnerProductsView(partner: partner)) {
                VStack {
                    Text(partner.name)
                    Text(partner.distance)
                }
            }
        }
    }
    
}
