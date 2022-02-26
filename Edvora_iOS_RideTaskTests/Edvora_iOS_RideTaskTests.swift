//
//  Edvora_iOS_RideTaskTests.swift
//  Edvora_iOS_RideTaskTests
//
//  Created by Eman Elrefai on 25/02/2022.
//

import XCTest
import Combine
@testable import Edvora_iOS_RideTask


class Edvora_iOS_RideTaskTests: XCTestCase {

    override func setUp() {
        
    }
    
    override func tearDown() {
        subscriptions = []
    }
    
    var subscriptions = Set<AnyCancellable>()
    
    func test_getting_rides_success() {
        let resultRide = Result<[Ride], APIError>.success([Ride.example1()])
        let resultUser = Result<[User], APIError>.success([User.example1()])
        
        let fetcher = RideFetcher(service: APIMockService(resultRide: resultRide, resultUser: resultUser))
        
        let promise = expectation(description: "getting rides")
        
        fetcher.$rides.sink { rides in
            if rides.count > 0 {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
       
        wait(for: [promise], timeout: 2)
    }
    
    
    func test_loading_error() {
       
         let resultRide = Result<[Ride], APIError>.failure(APIError.badURL)
         let resultUser = Result<[User], APIError>.failure(APIError.badURL)
        
         let fetcher = RideFetcher(service: APIMockService(resultRide: resultRide, resultUser: resultUser))
         
        let promise = expectation(description: "show error message")
        fetcher.$rides.sink { rides in
            if !rides.isEmpty {
                XCTFail()
            }
        }.store(in: &subscriptions)
        
        
        fetcher.$errorMessage.sink { message in
            if message != nil {
                promise.fulfill()
            }
        }.store(in: &subscriptions)
        
        wait(for: [promise], timeout: 2)
        
    }

}
