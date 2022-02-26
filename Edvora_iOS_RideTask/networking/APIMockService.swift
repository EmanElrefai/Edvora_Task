//
//  APIMockService.swift
//  APIMockService
//
//  Created by Eman Elrefai on 25/02/2022.
//

import Foundation

struct APIMockService: APIServiceProtocol {
    
    var resultRide: Result<[Ride], APIError>
    var resultUser: Result<[User], APIError>
    
    func fetchRides(url: URL?, completion: @escaping (Result<[Ride], APIError>) -> Void) {
        completion(resultRide)
    }
    
    
    func fetchUsers(url: URL?, completion: @escaping (Result<[User], APIError>) -> Void) {
        completion(resultUser)
    }
    
    
    
}
