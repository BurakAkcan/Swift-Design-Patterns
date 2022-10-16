//
//  AppContainer.swift
//  MovieBox
//
//  Created by Burak AKCAN on 11.10.2022.
//

import Foundation

let app = AppContainer()

final class AppContainer {
    let router = AppRouter()
    let service = MoviesService()
}
