//
//  MovieDetailView.swift
//  MovieBox
//
//  Created by Burak AKCAN on 12.10.2022.
//

import UIKit

class MovieDetailView: UIView {
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var artistNameLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
}

extension MovieDetailView: MovieDetailViewProtocol {
    func updateMovieDetail(_ moviedetail: MovieDetailPresentation) {
        movieTitleLabel.text = moviedetail.title
        genreLabel.text = moviedetail.genre
        artistNameLabel.text = moviedetail.artistName
    }
    
    
}
