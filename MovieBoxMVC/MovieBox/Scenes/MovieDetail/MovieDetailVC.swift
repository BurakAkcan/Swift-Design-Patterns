//
//  MovieDetailVC.swift
//  MovieBox
//
//  Created by Burak AKCAN on 12.10.2022.
//

import UIKit

class MovieDetailVC: UIViewController {
    
    @IBOutlet var customView: MovieDetailView!
    var movie:Movie?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        customView.updateMovieDetail(MovieDetailPresentation(movie: movie!))
    }

}
