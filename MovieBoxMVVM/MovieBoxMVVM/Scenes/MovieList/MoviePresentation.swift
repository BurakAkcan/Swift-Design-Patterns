//
//  MoviePresentation.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 13.10.2022.
//

import Foundation

final class MoviePresentation:NSObject {
    var title:String
    var detail:String
    
    init(title:String, detail:String) {
        self.title = title
        self.detail = detail
    }
}

extension MoviePresentation {
   convenience init(movie:Movie){
       
       self.init(title: movie.name, detail: movie.artistName)
        self.title = movie.name
        self.detail = movie.artistName
       
       
    }
}
