//
//  RideFetcher.swift
//  RideFetcher
//
//  Created by Eman Elrefai on 25/02/2022.
//

import Foundation


class RideFetcher: ObservableObject {
    
    @Published var rides = [Ride]()
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    let service: APIServiceProtocol
    
    init(service: APIServiceProtocol = APIService()) {
        self.service = service
        fetchAllRides()
    }
    
    func fetchAllRides() {
        
        isLoading = true
        errorMessage = nil
        
        let url = URL(string: "https://assessment.api.vweb.app/rides")
        service.fetchRides(url: url) { [unowned self] result in
            
            DispatchQueue.main.async {
                
                self.isLoading = false
                switch result {
                case .failure(let error):
                    self.errorMessage = error.localizedDescription
                    // print(error.description)
                    print(error)
                case .success(let rides):
                    print("--- sucess with \(rides.count)")
                    self.rides = rides
                }
            }
        }
        
    }
    
    
    //MARK: preview helpers
    
    static func errorState() -> RideFetcher {
        let fetcher = RideFetcher()
        fetcher.errorMessage = APIError.url(URLError.init(.notConnectedToInternet)).localizedDescription
        return fetcher
    }
    
    static func successState() -> RideFetcher {
        let fetcher = RideFetcher()
        fetcher.rides = [Ride.example1(), Ride.example2()]
        
        return fetcher
    }
}
