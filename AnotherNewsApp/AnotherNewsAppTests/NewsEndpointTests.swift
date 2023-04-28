//
//  ApiClientTests.swift
//  AnotherNewsAppTests
//
//  Created by Andrei Toader on 28.04.2023.
//

import XCTest
@testable import AnotherNewsApp

final class NewsEndpointTests: XCTestCase {
    
    var apiClient: ApiClient!
    var newsEndpoint: Endpoint!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        apiClient = ApiClient()
        newsEndpoint = NewsEndpoint(selectableTopic: SelectableTopic(topic: .sport, isSelected: false))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        apiClient = nil
    }
    
    func testEndpointResultsReceived() async {
        let results = await apiClient.fetchResources(endpoint: newsEndpoint) as Result<ResponseJSON, ApiError>
        
        XCTAssertNotNil(results)
    }
    
    func testEndpointContainsArticles() async {
        let results = await apiClient.fetchResources(endpoint: newsEndpoint) as Result<ResponseJSON, ApiError>
        
        switch results {
            case .success(let json):
                XCTAssertGreaterThan(json.articles.count, 0)
            case .failure(let error):
                XCTAssertNil(error)
        }
    }
    
    func testEndpointEveryArticleContainsDescription() async {
        let results = await apiClient.fetchResources(endpoint: newsEndpoint) as Result<ResponseJSON, ApiError>
        
        switch results {
            case .success(let json):
                for article in json.articles {
                    XCTAssertNotNil(article.description)
                }
            case .failure(let error):
                XCTAssertNotNil(error)
        }
    }
}
