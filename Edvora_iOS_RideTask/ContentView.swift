//
//  ContentView.swift
//  Edvora_iOS_RideTask
//
//  Created by Eman Elrefai on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var rideFetcher = RideFetcher()
    @StateObject var userFetcher = UserFetcher()
    
    var body: some View {
      
        if rideFetcher.isLoading {
            LoadingView()
        }else if rideFetcher.errorMessage != nil  {
            ErrorView(rideFetcher: rideFetcher)
        }else {
            RideListView(rides: rideFetcher.rides, users: userFetcher.users)
        }
      
          
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
