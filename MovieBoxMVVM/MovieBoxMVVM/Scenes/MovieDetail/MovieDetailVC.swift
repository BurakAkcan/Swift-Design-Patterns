//
//  MovieDetailVC.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 14.10.2022.
//

import UIKit

class MovieDetailVC: UIViewController {
    @IBOutlet weak var artistLabel: UILabel!
    
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var viewModel: MovieDetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        viewModel.load()
    }
    
    
}

extension MovieDetailVC: MovieDetailViewModelDelegate {
    func showDetail(_ presentation: MoviePresentation) {
        artistLabel.text = presentation.title
        titleLabel.text = presentation.detail
        
    }
}
