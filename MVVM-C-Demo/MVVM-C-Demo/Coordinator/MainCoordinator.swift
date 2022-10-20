//
//  MainCoordnator.swift
//  MVVM-C-Demo
//
//  Created by Burak AKCAN on 19.10.2022.
//

import UIKit

final class MainCoordinator: Coordinator {
    
    
    var childCoordinators: [Coordinator] = []
    
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let vc = ViewController.instatiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: false)
    }
    
    func buySubs() {
        let vc = BuyViewController.instatiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    func create() {
        let vc = CreateViewController.instatiate()
        vc.coordinator = self
        navigationController.pushViewController(vc, animated: true)
    }
    
    
}
