import SwiftUI
import EFQRCode

struct QRCodeImageView: View {
    
    let qrcode: String
    
    var body: some View {
        Image(EFQRCode.generate(content: qrcode)!, scale: 1, label: Text(""))
            .resizable()
            .aspectRatio(contentMode: .fit)
    }
    
}
