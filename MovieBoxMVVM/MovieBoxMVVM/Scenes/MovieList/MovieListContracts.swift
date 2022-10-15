//
//  MovieListContracts.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 13.10.2022.
//

import Foundation

protocol MovieListViewModelProtocol {
    //movie çekeceğimiz viewdidloadda göstereceğimiz fonk
    var delegate: MovieListViewModelDelegate?  { get set }
    func load()
    func selectMovie(at index: Int)
}

//view modelin outputları
enum MovieListViewModelOutput: Equatable {
//    static var allCases: [MovieListViewModelOutput] {
//        return [.updateTitle("test"),.setLoading(true),.showMovieList([])]
//    }
    case updateTitle(String)
    case setLoading(Bool)
    case showMovieList([MoviePresentation])
}

enum MovieListViewRoute {
    case detail(MovieDetailViewModelProtocol)
}

//ViewModel ile belli işlemler yapacağız belli noktalarda view a yapılması gereken işlemleri söyler
protocol MovieListViewModelDelegate: AnyObject {
    //Outputları delegate yapısına göndereceğiz o da handle edecek
    func handleViewModelOutput(_ output: MovieListViewModelOutput)
    func navigate(to route: MovieListViewRoute)
}
