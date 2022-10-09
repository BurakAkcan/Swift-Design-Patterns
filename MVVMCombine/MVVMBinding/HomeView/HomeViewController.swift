//
//  HomeViewController.swift
//  MVVMBinding
//
//  Created by Burak AKCAN on 9.10.2022.
//

import UIKit
import Combine

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    var homeViewModel:HomeViewModel = HomeViewModel()
    private var cancelables: Set<AnyCancellable> = []
    override func viewDidLoad() {
        super.viewDidLoad()
      //  homeViewModel.getLoggedUser()
        setupBinders()

    }
    override func viewWillAppear(_ animated: Bool) {
        homeViewModel.getLoggedUser()
    }
    private func setupBinders(){
        homeViewModel.$welcomeMessage.sink { [weak self] message in
            self?.welcomeLabel.text = message
        }.store(in: &cancelables)
        
    }
}
