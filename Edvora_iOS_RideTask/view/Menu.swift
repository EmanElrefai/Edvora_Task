//
//  Menu.swift
//  Edvora_iOS_RideTask
//
//  Created by Eman Elrefai on 26/02/2022.
//
import SwiftUI

struct Menu : View {
    let ride: Ride
    
    var body : some View{
        
        VStack(alignment: .leading) {

            HStack {
                VStack(alignment: .leading){
                    
                    Text("Ride ID").foregroundColor(.gray)
                    
                    Text("\(ride.id)").foregroundColor(.black)
                }
                
                Spacer()
                VStack (alignment: .leading) {
                    Text("Origin Station").foregroundColor(.gray)
                    
                    Text("\(ride.originStationCode)").foregroundColor(.black)
                }
              
            }
            Divider()
            HStack {
                VStack(alignment: .leading){
                    
                    Text("Date").foregroundColor(.gray)
                    
                    Text("\(ride.date)").foregroundColor(.black)
                }
                
                Spacer()
                VStack (alignment: .leading){
                    Text("Distance").foregroundColor(.gray)
                    
                    Text("\(ride.destinationStationCode)").foregroundColor(.black)
                }//.padding(.init(top: 0, leading: 0, bottom: 0, trailing: 32))
            }
            Divider()
            HStack {
                VStack(alignment: .leading){
                    
                    Text("State").foregroundColor(.gray)
                    
                    Text("\(ride.state)").foregroundColor(.black)
                }
                
                Spacer()
                VStack(alignment: .leading) {
                    Text("Distance").foregroundColor(.gray)
                    
                    Text("\(ride.city)").foregroundColor(.black)
                }
            }
            Divider()
    
            VStack(alignment: .leading){
                
                Text("Station Path").foregroundColor(.gray)
                HStack {
                ForEach(ride.stationPath, id: \.self) { pathElement in
                    if (pathElement==ride.stationPath.last){
                        Text("\(pathElement)")
                    
                    } else {
                        Text("\(pathElement), ")
                        
                    }
                  
                  
                    
                }
                    
            }
            
            }
        }.padding()
        .background(Color.white)
        .cornerRadius(15)
    }

}
