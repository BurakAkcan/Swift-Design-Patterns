//
//  MovieDetailBuilder.swift
//  MovieBox
//
//  Created by Burak AKCAN on 12.10.2022.
//

import Foundation
import UIKit

final class MovieDetailBuilder {

static func make(with movie:Movie)->MovieDetailVC {
    let storyboard = UIStoryboard(name: "MovieDetail", bundle: nil)
    let viewController = storyboard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
    viewController.movie = movie
    return viewController
  }
}
