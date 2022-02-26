//
//  APIServiceProtocol.swift
//  APIServiceProtocol
//
//  Created by Eman Elrefai on 25/02/2022.
//

import Foundation


protocol APIServiceProtocol {
    func fetchRides(url: URL?, completion: @escaping(Result<[Ride], APIError>) -> Void)
    func fetchUsers(url: URL?, completion: @escaping(Result<[User], APIError>) -> Void)
}
