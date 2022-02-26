//
//  User.swift
//  Edvora_iOS_RideTask
//
//  Created by Eman Elrefai on 26/02/2022.
//


import Foundation
import SwiftUI

/*

 {"station_code":94,"name":"Leah Anthony","url":"https://picsum.photos/200"}

 */


struct User: Codable, Identifiable {
    let id = UUID()
    let stationCode: Int
    let name: String
    let url: String?

    
    enum CodingKeys: String, CodingKey {
        case stationCode = "station_code"
        case name
        case url
     
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        stationCode = try values.decode(Int.self, forKey: .stationCode)
        name = try values.decode(String.self, forKey: .name)
        url = try values.decode(String.self, forKey: .url)

        
     
    }
    
    init(stationCode: Int, name: String, url: String) {
        self.stationCode = stationCode
        self.name = name
        self.url = url
    }
   
    /*

     {"station_code":94,"name":"Leah Anthony","url":"https://picsum.photos/200"}

     */
 
    static func example1() -> User {
        return User(stationCode: 94, name: "Leah Anthony", url: "https://picsum.photos/200")

    }
    
    /*
     {"station_code":69,"name":"Galvin Ashley","url":"https://picsum.photos/200"}
     */
    
    static func example2() -> User {
        return User(stationCode: 69, name: "Galvin Ashley", url: "https://picsum.photos/200")

    }
}
