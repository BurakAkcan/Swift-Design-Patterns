//
//  MovieDetailViewModel.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 14.10.2022.
//

import Foundation


final class MovieDetailViewModel: MovieDetailViewModelProtocol {
  
    
    var delegate: MovieDetailViewModelDelegate?
    
  
    private let presentation: MoviePresentation
    
    init(movie: Movie){
        self.presentation = MoviePresentation(movie: movie)
    }
    
    func load() {
        delegate?.showDetail(presentation)
    }
    
    
}
