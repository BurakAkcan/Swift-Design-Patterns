//
//  MovieListContracts.swift
//  MovieBox
//
//  Created by Burak AKCAN on 11.10.2022.
//

import Foundation



@objc protocol MovieListViewProtocol: AnyObject {
    var delegate:MovieListViewDelegate? {get set}
    func updateMovieList(_ movieList:[MoviePresentation])
    func setLoading(_ isLoading:Bool)
}

@objc protocol MovieListViewDelegate:AnyObject {
    func didSelectMovie(at index:Int)
}
