//
//  MoveDetailViewBuilder.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 14.10.2022.
//

import Foundation
import UIKit

final class MoviedetailViewBuilder {
    static func make(with viewModel: MovieDetailViewModelProtocol)->MovieDetailVC {
        let stroyBoard = UIStoryboard(name: "MovieDetail", bundle: nil)
        let viewController = stroyBoard.instantiateViewController(withIdentifier: "MovieDetailVC") as! MovieDetailVC
        viewController.viewModel = viewModel
        return viewController
    }
}
