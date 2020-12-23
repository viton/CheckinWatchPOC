//
//  ContentView.swift
//  CheckinWatchPoc
//
//  Created by Vitor Oliveira on 16/12/20.
//  Copyright © 2020 Nothing. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var locationManager = Locationmanager.shared
    
    var body: some View {
        let coordinates = self.locationManager.location?.coordinate
        return VStack {
            Text("HELLO WORLD")
            coordinates != nil ?
                Text("GOT A LOCATION \(String(coordinates!.latitude)) and \(String(coordinates!.longitude))")
                : Text("DONT HAVE A LOCATION YET")
            Button(action: {
                print("TOOOOUCH")
                self.locationManager.start()
            }, label: {
                Text("TOUCH")
            })
        }
    }
}
