//
//  ResourcesLoader.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 13.10.2022.
//

import Foundation

class ResourcesLoader {
    enum MovieResource: String {
        case movie3
        case movie2
    }
    static func loadMovie(resource: MovieResource) throws -> Movie {
       //  let url = Bundle.main.url(forResource: resource.rawValue, withExtension: "json")
        print(resource.rawValue)
        let url =  Bundle.main.url(forResource: resource.rawValue, withExtension: "json").unsafelyUnwrapped
        let data = try Data(contentsOf: url)
        let decoder = Decoders.plainDateDecoder
        let movie = try decoder.decode(Movie.self, from: data)
            return movie
    }
    

}

