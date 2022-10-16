//
//  MovieListView.swift
//  MovieBox
//
//  Created by Burak AKCAN on 11.10.2022.
//

import UIKit



 final class MovieListView: UIView {
     private var movieList:[MoviePresentation] = []
     @IBOutlet weak var tableView: UITableView!
     weak var delegate:MovieListViewDelegate?
     
}

extension MovieListView: MovieListViewProtocol {
    func setLoading(_ isLoading: Bool) {
        //UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
    }
    
    func updateMovieList(_ movieList: [MoviePresentation]) {
        self.movieList = movieList
        tableView.reloadData()
    }
}

extension MovieListView:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectMovie(at: indexPath.row)
    }
}
extension MovieListView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieListCell", for: indexPath)
        let movieItem = movieList[indexPath.row]
        cell.textLabel?.text = movieItem.title
        cell.detailTextLabel?.text = movieItem.detail
        return cell
    }
}
