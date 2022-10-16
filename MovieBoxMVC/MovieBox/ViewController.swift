//
//  ViewController.swift
//  MovieBox
//
//  Created by Burak AKCAN on 3.10.2022.
//

import UIKit

class ViewController: UIViewController {
    let service: MoviesServiceProtocol = MoviesService()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.fetchMovies { (result) in
            print(result)
        }
    }


}

    
