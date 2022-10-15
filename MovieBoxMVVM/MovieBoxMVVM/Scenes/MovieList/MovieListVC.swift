//
//  MovieListVC.swift
//  MovieBoxMVVM
//
//  Created by Burak AKCAN on 13.10.2022.
//

import UIKit

class MovieListVC: UIViewController {

    @IBOutlet weak var circleIndicator: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: MovieListViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }
    private var moveList: [MoviePresentation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        viewModel.load()
     
    }
}
extension MovieListVC: MovieListViewModelDelegate {
    func navigate(to route: MovieListViewRoute) {
        switch route {
        case .detail(let viewModel):
          let viewController =  MoviedetailViewBuilder.make(with: viewModel)
            show(viewController, sender: nil)
        }
    }
    
    func handleViewModelOutput(_ output: MovieListViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let value):
            value == true ? circleIndicator.startAnimating() : circleIndicator.removeFromSuperview()
        case .showMovieList(let movieList):
            self.moveList = movieList
            tableView.reloadData()
            break
            // TODO Implements;
        }
    }
    
    
}

extension MovieListVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moveList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        cell.textLabel?.text = moveList[indexPath.row].title
        cell.detailTextLabel?.text = moveList[indexPath.row].detail
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectMovie(at: indexPath.row)
    }
    
    
}
