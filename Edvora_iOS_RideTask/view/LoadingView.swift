//
//  LoadingView.swift
//  LoadingView
//
//  Created by Eman Elrefai on 25/02/2022.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack(spacing: 20)  {
            
            ProgressView()
            Text("Loading")
                .foregroundColor(.gray)
            
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
