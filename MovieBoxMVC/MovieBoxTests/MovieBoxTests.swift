//
//  MovieBoxTests.swift
//  MovieBoxTests
//
//  Created by Burak AKCAN on 3.10.2022.
//

import XCTest
@testable import MovieBox



class MovieBoxTests: XCTestCase {
    
    private var service: MockService!
    private var view: MockListView!
    var controller: MovieListVC!
    

    override func setUpWithError() throws {
        service = MockService()
        view = MockListView()
        controller = MovieListVC()
        
        controller.customView = view
        controller.service = service
    }

    
    
    func testMovieList() {
        //Given
        service.movies = []
        
        //When
        controller.loadViewIfNeeded()
        
        //Then
        XCTAssertEqual(view.movieList?.count, 0)
        
    }

}
 final class MockService: MoviesServiceProtocol {
    var movies: [Movie] = []
    func fetchMovies(completion: @escaping (Result<TopMoviesResponse, Error>) -> Void) {
       // completion(.success(TopMoviesResponse(results: movies)))
    }
    
    
}

 final class MockListView: MovieListViewProtocol {
    var delegate: MovieListViewDelegate?
    var movieList: [MoviePresentation]?
    
    func updateMovieList(_ movieList: [MoviePresentation]) {
        self.movieList = movieList
    }
    
    func setLoading(_ isLoading: Bool) {
        
    }
    
    
}
