//
//  MovieDetailPresentation.swift
//  MovieBox
//
//  Created by Burak AKCAN on 12.10.2022.
//

import Foundation

struct MovieDetailPresentation {
    let title:String
    let artistName:String
    let genre:String
}


extension MovieDetailPresentation {
    init(movie:Movie){
        self.artistName = movie.artistName
        self.title = movie.name
        self.genre = movie.genres.map({$0.name}).joined(separator: ", ")
    }
}
