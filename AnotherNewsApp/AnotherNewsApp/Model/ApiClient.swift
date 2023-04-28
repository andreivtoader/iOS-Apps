//
//  ApiClient.swift
//  AnotherNewsApp
//
//  Created by Andrei Toader on 28.04.2023.
//

import Foundation

class ApiClient {
    
    func fetchResourcesSync<T>(endpoint: Endpoint) async -> (Result<T, ApiError>) where T : Codable {
        
        guard let url = endpoint.url else {
            return .failure(.couldNotConnectToHost)
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            guard let resource = try? JSONDecoder().decode(T.self, from: data) else {
                return .failure(.jsonError)
            }
            
            return .success(resource)
        }
        catch {
            return .failure(.serverError)
        }
    }
    
}
