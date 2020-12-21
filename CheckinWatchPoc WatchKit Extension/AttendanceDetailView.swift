import SwiftUI

struct AttendanceDetailView: View {
    
    let partner: Partner
    let product: Product
    
    @State var showModal = false
    
    @ObservedObject private var session: ViewModelWatch = ViewModelWatch.shared
    
    var body: some View {
        
        let attendance = session.lastAttendance
        
        return VStack {
            if (attendance != nil) {
                Text("Attendance")
                Text(attendance!.partner.name)
                Text(attendance!.partner.product.name)
                Text(attendance!.date)
                
                if (attendance!.validation.type == "QRCODE") {
                    Button(action: {
                        print("VE SE OFOI")
                        self.showModal = true
                    }, label: {
                        Text("QRCODE")
                    })
                }
            } else {
                NearbyAnimationView()
            }
        }.onAppear(perform: {
            self.session.sendCheckin(partner: self.partner, product: self.product)
        }).sheet(isPresented: self.$showModal) {
            QRCodeImageView(qrcode: attendance!.validation.info)
        }

    }
    
}
