//
//  MovieListVC.swift
//  MovieBox
//
//  Created by Burak AKCAN on 11.10.2022.
//

import UIKit


final class MovieListVC: UIViewController {
    
    var service: MoviesServiceProtocol!
    
    private var movieList:[Movie] = []

    @IBOutlet  var customView: MovieListViewProtocol!{
        didSet {
            customView.delegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        fetchDatas()
       }
    private func fetchDatas(){
        customView.setLoading(true)
        service.fetchMovies {[weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let movieResponse):
                self.movieList = movieResponse.results
                let presentation = movieResponse.results.map(MoviePresentation.init)
                self.customView.updateMovieList(presentation)
            case .failure(let error):
                print(error.localizedDescription)
               
            }
            self.customView.setLoading(false)
        }
    }


}

extension MovieListVC : MovieListViewDelegate {
    func didSelectMovie(at index: Int) {
        let movie = movieList[index]
        let movieDetailViewController = MovieDetailBuilder.make(with: movie)
        show(movieDetailViewController, sender: nil)
    }
    
    
}
