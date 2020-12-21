//
//  ContentView.swift
//  CheckinWatchPoc WatchKit Extension
//
//  Created by Vitor Oliveira on 16/12/20.
//  Copyright © 2020 Nothing. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var session: ViewModelWatch = ViewModelWatch.shared
    
    var body: some View {
        
        return VStack {
            NavigationLink(destination: NearbyLoaderView()) {
                Text("Check in")
            }
        }
        
    }
}

