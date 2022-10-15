//
//  MoviesService.swift
//  MovieBox
//
//  Created by Burak AKCAN on 3.10.2022.
//

import Foundation
import Alamofire
public enum Error: Swift.Error {
    case serializationError(internal : Swift.Error)
    case networkError(internal: Swift.Error)
}
    
public protocol MoviesServiceProtocol{
    func fetchMovies(completion:@escaping (Result<TopMoviesResponse,Error>)->Void)
}

public class MoviesService: MoviesServiceProtocol {
    public init(){}
    public func fetchMovies(completion:@escaping (Result<TopMoviesResponse, Error>) -> Void) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        
        AF.request(urlString).responseData { (response) in
            switch response.result {
            case .success(let data):
                let decoder = Decoders.plainDateDecoder
                
                do{
                    let result = try decoder.decode(TopMoviesResponse.self, from: data)
                    completion(.success(result))
                }catch{
                    completion(.failure(Error.serializationError(internal: error)))
                }
                
            case .failure(let error):
                completion(.failure(.serializationError(internal: error)))
            }
        }
        
    }
    
  
    
}
