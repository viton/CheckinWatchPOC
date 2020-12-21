import SwiftUI

struct PartnerProductsView: View {
    
    @ObservedObject private var session: ViewModelWatch = ViewModelWatch.shared
    @State var showAlert = false
    @State var showModal = false
    let partner: Partner
    @State var selectedProduct: Product?
    
    var body: some View {
        List(partner.products, id: \.id) { product in
            VStack {
//                NavigationLink(destination: AttendanceDetailView(partner: self.partner, product: product)) {
//                    VStack {
//                        Text(product.name)
//                    }
//                }
                Button(action: {
                    self.showAlert = true
                }, label: {
                    Text(product.name)
                }).alert(isPresented: self.$showAlert) {
                    Alert(
                        title: Text("Check-in"),
                        message: Text("You're sure you want to check-in on \(product.name)?"),
                        primaryButton: .default(Text("Cancel")),
                        secondaryButton: .default(Text("Check-in!"), action: {
                            self.selectedProduct = product
                            self.showModal = true
                        })
                    )
                }.sheet(isPresented: self.$showModal, content: {
                    AttendanceDetailView(partner: self.partner, product: self.selectedProduct!)
                })
            }
        }
    }
    
}
