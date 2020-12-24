//
//  Network.swift
//  CheckinWatchPoc
//
//  Created by Natalia Braz on 23/12/20.
//  Copyright © 2020 Nothing. All rights reserved.
//

import Foundation
import Apollo

class Network {
  static let shared = Network()
  
  private(set) lazy var apollo = ApolloClient(url: URL(string: "https://nataliabraz.dev/mymovies/api")!)
}
