//
//  TopMoviesResponse.swift
//  MovieBox
//
//  Created by Burak AKCAN on 3.10.2022.
//

import Foundation

public struct TopMoviesResponse: Decodable {
    
    private enum RootCodingKeys: String, CodingKey {
        case feed
    }
    private enum FeedCodingKeys: String, CodingKey {
        case results
    }
    
    
    let results: [Movie]
    
    init(results:[Movie]) {
        self.results = results
    }
    
    public init(from decoder: Decoder) throws {
        let rootContainer = try decoder.container(keyedBy: RootCodingKeys.self)
        let feedContainer = try rootContainer.nestedContainer(keyedBy: FeedCodingKeys.self, forKey: .feed)
        self.results = try feedContainer.decode([Movie].self, forKey: .results)
    }
}
