//
//  ErrorView.swift
//  ErrorView
//
//  Created by Eman Elrefai on 25/02/2022.
//

import SwiftUI

struct ErrorView: View {
    @ObservedObject var rideFetcher: RideFetcher
    var body: some View {
        VStack {
            
            Text("❌")
                .font(.system(size: 80))
            
            Text(rideFetcher.errorMessage ?? "")
            
            Button {
                rideFetcher.fetchAllRides()
            } label: {
                Text("Try again")
            }

            
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(rideFetcher: RideFetcher())
    }
}
