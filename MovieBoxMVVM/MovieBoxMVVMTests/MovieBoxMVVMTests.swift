//
//  MovieBoxMVVMTests.swift
//  MovieBoxMVVMTests
//
//  Created by Burak AKCAN on 13.10.2022.
//

import XCTest
@testable import MovieBoxMVVM

class MovieBoxMVVMTests: XCTestCase {
    private var viewModel: MovieListViewModel!
    private var service: MockTopMoviesService!
    private var view: MockView!

    override func setUpWithError() throws {
        service = MockTopMoviesService()
        viewModel = MovieListViewModel(service: service)
        view = MockView()
        viewModel.delegate = view
    }


    func testExample() throws {
        //Given;

        let movie2 = try ResourcesLoader.loadMovie(resource: .movie2)
        service.movies = [movie2]
        //When;
        viewModel.load()
        
        //Then;
        XCTAssertEqual(view.outputs.count, 4)
        
        switch view.outputs[0] {
        case .updateTitle(_):
           break //Succes
        default:
            XCTFail("We expection update title")
        }
        
        XCTAssertEqual(view.outputs[1], .setLoading(true))
        XCTAssertEqual(view.outputs[2], .setLoading(false))
       let expectedMovies = [movie2].map({MoviePresentation(movie: $0)})
       // XCTAssertEqual(view.outputs[3], .showMovieList(expectedMovies))
       // XCTAssertEqual(view.outputs[3], .showMovieList(expectedMovies))
        
    }


}

private class MockView: MovieListViewModelDelegate {
    
    var outputs: [MovieListViewModelOutput] = []
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        self.outputs.append(output)
    }
}



final class MockTopMoviesService: MoviesServiceProtocol {
    var movies:[Movie] = []
    func fetchMovies(completion: @escaping (Result<TopMoviesResponse, Error>) -> Void) {
        completion(.success(TopMoviesResponse(results: movies)))
    }
    
    
}
