//
//  Coordinator.swift
//  MVVM-C-Demo
//
//  Created by Burak AKCAN on 19.10.2022.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get  set }
    var navigationController:UINavigationController { get set }
    
    func start()
}

