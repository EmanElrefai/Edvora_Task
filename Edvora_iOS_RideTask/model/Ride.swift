//
//  Ride.swift
//  Ride
//
//  Created by Eman Elrefai on 25/02/2022.
//

import Foundation
import SwiftUI

/*

 {"id":988,"origin_station_code":13,"station_path":[47,50,66,71,87],"destination_station_code":95,"date":"02/08/2022 04:06 AM","map_url":"https://picsum.photos/200","state":"Odisha","city":"Brahmapur"}

 */


struct Ride: Codable, Identifiable {
    
    let id: Int
    let originStationCode: Int
    let stationPath: [Int]
    let destinationStationCode: Int
    let date: String
    let mapURL: String?
    let state: String
    let city: String
    
//    var description: String {
//        return "\(date[...7])"
//    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case originStationCode = "origin_station_code"
        case stationPath = "station_path"
        case destinationStationCode = "destination_station_code"
        case date
        case mapURL = "map_url"
        case state
        case city
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(Int.self, forKey: .id)
        originStationCode = try values.decode(Int.self, forKey: .originStationCode)
        stationPath = try values.decode([Int].self, forKey: .stationPath)
        destinationStationCode = try values.decode(Int.self, forKey: .destinationStationCode)
        date = try values.decode(String.self, forKey: .date)
        mapURL = try values.decode(String.self, forKey: .mapURL)
        state = try values.decode(String.self, forKey: .state)
        city = try values.decode(String.self, forKey: .city)
        
     
    }
    
    init(id: Int, originStationCode: Int, stationPath: [Int] , destinationStationCode: Int, date: String, mapURL: String?, state: String, city: String){
        self.id = id
        self.originStationCode = originStationCode
        self.stationPath = stationPath
        self.destinationStationCode = destinationStationCode
        self.date = date
        self.mapURL = mapURL
        self.state = state
        self.city = city
    }
    
    /*
    "id":988,"origin_station_code":13,"station_path":[47,50,66,71,87],"destination_station_code":95,"date":"02/08/2022 04:06 AM","map_url":"https://picsum.photos/200","state":"Odisha","city":"Brahmapur"
     */
 
    static func example1() -> Ride {
        return Ride(id: 988, originStationCode: 13, stationPath: [47,50,66,71,87], destinationStationCode: 95, date: "02/08/2022 04:06 AM", mapURL: "https://picsum.photos/200", state: "Odisha", city: "Brahmapur")
        
    }
    
    /*
     {"id":359,"origin_station_code":13,"station_path":[63,70,83],"destination_station_code":91,"date":"02/11/2022 11:47 AM","map_url":"https://picsum.photos/200","state":"Chhattisgarh","city":"Raipur"}
     */
    
    static func example2() -> Ride {
        return Ride(id: 359, originStationCode: 13, stationPath: [63,70,83], destinationStationCode: 91, date: "02/11/2022 11:47 AM", mapURL: "https://picsum.photos/200", state: "Chhattisgarh", city: "Raipur")
        
    }
}


