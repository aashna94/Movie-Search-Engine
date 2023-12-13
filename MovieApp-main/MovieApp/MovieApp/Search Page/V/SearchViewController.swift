//
//  SearchViewController.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import UIKit

class SearchViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak private var tableView: UITableView!
    @IBOutlet weak private var searchBar: UISearchBar!
    @IBOutlet weak private var descriptionLabel: UILabel!
    @IBOutlet weak private var loadingIndicator: UIActivityIndicatorView!
    
    var viewModel: SearchViewModelCapabilities!
    var coordinator: (Coordinator & DetailsPageNavigating)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModelObservers()
    }
    
    private func setupViewModelObservers() {
        viewModel.refreshListUI = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.searchStateDidUpdate = { [weak self] newState in
            self?.tableView.isHidden = (newState != .data)
            self?.descriptionLabel.isHidden = (newState == .data)
            self?.loadingIndicator.isHidden = (newState != .loading)
            self?.descriptionLabel.text = newState.getStateDescription()
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        viewModel.fetchMovieSearchResults(queryString: searchBar.text)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            DispatchQueue.main.async {
                self.viewModel.fetchMovieSearchResults(queryString: searchBar.text)
                searchBar.resignFirstResponder()
            }
        }
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfSearchItems()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let searchItem = viewModel.searchItem(atIndex: indexPath.row) else {
            assertionFailure("Querying for search item beyond bounds")
            return UITableViewCell()
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            assertionFailure("Cell with identifier `SearchTableViewCell` does not exist")
            return UITableViewCell()
        }
        
        cell.configure(withDataProvider: searchItem, andImageServiceProvider: viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == viewModel.numberOfSearchItems() - 1 {
            if viewModel.numOfPagesLoaded() < viewModel.totalOfPagesLoaded() {
                DispatchQueue.main.async { [weak self] in
                    self?.viewModel.fetchMovieSearchResults(queryString: self?.searchBar.text)
                }
            }
        }
    }
}

extension SearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let searchItem = viewModel.searchItem(atIndex: indexPath.row) else { return }
        coordinator?.navigateToDetailsPage(data: searchItem)
    }
}
