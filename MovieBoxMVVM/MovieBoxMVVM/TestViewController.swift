//
//  TestViewController.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 13.10.2022.
//

import UIKit

class TestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
            view.backgroundColor = .yellow
        let movie1 = try!  ResourcesLoader.loadMovie(resource: .movie2)
        print(movie1)
        
       
        }
    


}
