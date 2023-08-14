//
//  MockAPIClient.swift
//  NMD
//
//  Created by Andrei Toader on 12.08.2023.
//

import Foundation
import Combine

struct MockAPIClient: API {
    
    private static let delay = 2
    
    private func loadJson(fileName: String) -> [GratitudeJSON]? {
        do {
            guard let url = Bundle.main.url(forResource: fileName, withExtension: "json") else {
                print("Wrong URL")
                return nil
            }
            
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([GratitudeJSON].self, from: data)
        } catch {
            print(error)
            return nil
        }
    }
    
    // mocked API data, with 5 seconds delay to simulate the network request
    func fetchGratitudes(completion: @escaping (Result<[GratitudeJSON], APIError>) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Self.delay)) {
            let json = self.loadJson(fileName: "mock_data")
            
            if let data = json {
                completion(.success(data))
            } else {
                completion(.failure(.wrongJSONdata))
            }
        }
    }

    

}
