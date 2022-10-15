//
//  MovieListBuilder.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 14.10.2022.
//

import Foundation
import UIKit


final class MovieListBuilder {
    static func make()->MovieListVC{
        let storyBoard = UIStoryboard(name: "MovieList", bundle: nil)
       let viewController = storyBoard.instantiateViewController(withIdentifier: "MovieListVC") as! MovieListVC
        viewController.viewModel = MovieListViewModel(service: app.service)
        return viewController
    }
}
