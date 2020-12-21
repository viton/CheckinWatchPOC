import SwiftUI

struct NearbyLoaderView: View {
    
    @ObservedObject private var session: ViewModelWatch = ViewModelWatch.shared
    @State var loading = true
    
    var body: some View {
        VStack {
            if loading && self.session.partners == nil {
                NearbyAnimationView()
            } else {
                PartnersListView(partners: self.session.partners!)
            }
        }.onAppear {
            self.session.sendMessageAndGetData()
        }
    }
    
}
