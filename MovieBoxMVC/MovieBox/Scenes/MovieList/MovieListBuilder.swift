//
//  MovieListBuilder.swift
//  MovieBox
//
//  Created by Burak AKCAN on 11.10.2022.
//

import UIKit

final class MovieListBuilder {
    static func make()-> MovieListVC {
        let storyBoard = UIStoryboard(name: "MovieList", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: "MovieListVC") as! MovieListVC
        viewController.service = app.service
        return viewController
    }
}

