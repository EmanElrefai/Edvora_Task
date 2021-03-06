//
//  APIService.swift
//  APIService
//
//  Created by Eman Elrefai on 25/02/2022.
//

import Foundation
import SwiftUI


struct APIService: APIServiceProtocol {
    
    func fetch<T: Decodable>(_ type: T.Type, url: URL?, completion: @escaping(Result<T,APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let result = try decoder.decode(type, from: data)
                    completion(Result.success(result))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }

            }
        }

        task.resume()
    }
    
    
    func fetchRides(url: URL?, completion: @escaping(Result<[Ride], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let rides = try decoder.decode([Ride].self, from: data)
                    completion(Result.success(rides))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
                
                
            }
        }

        task.resume()
        
    }
    
    func fetchUsers(url: URL?, completion: @escaping(Result<[User], APIError>) -> Void) {
        guard let url = url else {
            let error = APIError.badURL
            completion(Result.failure(error))
            return
        }
        let task = URLSession.shared.dataTask(with: url) {(data , response, error) in
            
            if let error = error as? URLError {
                completion(Result.failure(APIError.url(error)))
            }else if  let response = response as? HTTPURLResponse, !(200...299).contains(response.statusCode) {
                completion(Result.failure(APIError.badResponse(statusCode: response.statusCode)))
            }else if let data = data {
                let decoder = JSONDecoder()
                do {
                    let users = try decoder.decode([User].self, from: data)
                    completion(Result.success(users))
                    
                }catch {
                    completion(Result.failure(APIError.parsing(error as? DecodingError)))
                }
                
                
            }
        }

        task.resume()
        
    }
}
