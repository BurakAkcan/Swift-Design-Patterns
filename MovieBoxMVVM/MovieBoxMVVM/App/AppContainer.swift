//
//  AppContainer.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 13.10.2022.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = MoviesService()
}
