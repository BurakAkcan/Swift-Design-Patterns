//
//  AppRouter.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 13.10.2022.
//

import Foundation
import UIKit

final class AppRouter {
    var window: UIWindow
    
    init(){
        window = UIWindow(frame: UIScreen.main.bounds)
    }
    func start() {
        let viewController = UIViewController()
        viewController.view.backgroundColor = .orange
        viewController.title = "Test"
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    

}
