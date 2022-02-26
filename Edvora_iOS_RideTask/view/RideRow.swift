//
//  RideRow.swift
//  RideRow
//
//  Created by Eman Elrefai on 25/02/2022.
//

import SwiftUI

struct RideRow: View {
    let ride: Ride
    let imageSize: CGFloat = 100
    
    var body: some View {
        
        VStack {
            if ride.mapURL != nil {
                AsyncImage(url: URL(string: ride.mapURL!)) { phase in
                    if let image = phase.image {
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                        
                    } else if phase.error != nil {
                        
                        Text(phase.error?.localizedDescription ?? "error")
                            .foregroundColor(Color.pink)
                            .frame(width: imageSize, height: imageSize)
                    } else {
                        Image("mapImage")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }
                    
                }
            }else {
                Color.gray.frame(width: imageSize, height: imageSize)
            }
            
            HStack {
                HStack() {
                    HStack(){
                        Image("hashIcon")
                        Text("\(ride.id)")
                    }
                    Spacer()
                    
                    HStack(){
                        Image("dateIcon")
                        Text("\(ride.date)")
                    }
                    
                }
                .layoutPriority(100)
                
                Spacer()
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
        )
        .padding([.top, .horizontal])
        
        .contextMenu {
            cardContextMenu
        }
    }
    
    var cardContextMenu: some View {
        
        
        Section {
            Button(action: {}) {
                Text("Ride ID: \(ride.id)")
            }
            
            Button(action: {}) {
                Text("Origin Station: \(ride.originStationCode)")
                
            }
            Button(action: {}) {
                Text("Date: \(ride.date)")
            }
            Button(action: {}) {
                Text("Distance: \(ride.destinationStationCode)")
            }
            Button(action: {}) {
                Text("State: \(ride.state)")
            }
            Button(action: {}) {
                Text("Distance: \(ride.city)")
            }
            
        }
    }
}


struct RideRow_Previews: PreviewProvider {
    static var previews: some View {
        RideRow(ride: Ride.example1())
            .previewLayout(.fixed(width: 400, height: 200))
    }
}
