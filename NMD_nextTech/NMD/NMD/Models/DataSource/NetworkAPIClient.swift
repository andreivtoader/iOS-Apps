//
//  NetworkAPIClient.swift
//  NMD
//
//  Created by Andrei Toader on 12.08.2023.
//

import Foundation

struct NetworkAPIClient : API {
    func fetchGratitudes(completion: @escaping (Result<[GratitudeJSON], APIError>) -> Void) {
        completion(.failure(.notImplementedYet))
    }
    
    
}
