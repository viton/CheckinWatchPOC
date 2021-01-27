//
//  ContentView.swift
//  CheckinWatchPoc
//
//  Created by Vitor Oliveira on 16/12/20.
//  Copyright © 2020 Nothing. All rights reserved.
//

import SwiftUI
import Apollo

struct ContentView: View {
  
  func getMovies() -> Void {
  
    Network.shared.apollo.fetch(query: PopularMoviesQuery()) { result in
      guard let data = try? result.get().data else { return }
            
      let movies = data.popularMovies as! [PopularMoviesQuery.Data.PopularMovie]
      
      movies.forEach { movie in
        print("Movie ID:", movie.id!)
        print("Movie Title:", movie.title!)
        print("Movie Release Date:", movie.releaseDate!)
      }
    }
  }

    @ObservedObject private var locationManager = Locationmanager.shared
    
    var body: some View {
        getMovies()

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
