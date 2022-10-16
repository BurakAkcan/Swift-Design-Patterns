//
//  AppRouter.swift
//  MovieBox
//
//  Created by Burak AKCAN on 11.10.2022.
//

import UIKit

final class AppRouter {
    let window: UIWindow
    
    init(){
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    
    func start(){
        
        
        let viewController = MovieListBuilder.make()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
