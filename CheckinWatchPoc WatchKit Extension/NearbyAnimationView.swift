import SwiftUI

struct NearbyAnimationView: View {
    
    @State private var animationAmount: CGFloat = 1
    @State private var animationOpacitiy: Double = 1
    
    var body: some View {
        Circle()
        .frame(width: 20, height: 20, alignment: .center)
        .foregroundColor(Color.red)
        .clipShape(Circle())
        .opacity(animationOpacitiy)
        .overlay(
            Circle()
                .stroke(Color.red)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
            ).overlay(
                Circle()
                .stroke(Color.red)
                    .scaleEffect(animationAmount * 1.4)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
            ).overlay(
                Circle()
                .stroke(Color.red)
                    .scaleEffect(animationAmount * 1.8)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
            )
        )
        .onAppear {
            self.animationAmount = 2
        }
    }
    
}
