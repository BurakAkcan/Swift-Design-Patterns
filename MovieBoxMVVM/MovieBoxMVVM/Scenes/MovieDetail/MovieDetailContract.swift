//
//  MovieDetailContract.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 14.10.2022.
//

import Foundation

protocol MovieDetailViewModelDelegate {
    func showDetail(_ presentation: MoviePresentation )
}
protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? {get set}
    func load()
}
