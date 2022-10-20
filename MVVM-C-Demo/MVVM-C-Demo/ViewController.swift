//
//  ViewController.swift
//  MVVM-C-Demo
//
//  Created by Burak AKCAN on 19.10.2022.
//

import UIKit

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }

    @IBAction func buyTap(_ sender: UIButton) {
        coordinator?.buySubs()
    }
    
    @IBAction func createTap(_ sender: UIButton) {
        coordinator?.create()
    }
}

