//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak private var moviePosterImageView: ImageServiceProvider!
    @IBOutlet weak private var movieTitleLabel: UILabel!
    @IBOutlet weak private var movieReleaseYearLabel: UILabel!
    @IBOutlet weak private var movieImdbRatingLabel: UILabel!
    @IBOutlet weak private var movieGenreLabel: UILabel!
    @IBOutlet weak private var movieEarningsLabel: UILabel!
    @IBOutlet weak private var moviePlotLabel: UILabel!
    @IBOutlet weak private var loadingIndicator: UIActivityIndicatorView!
    
    var viewModel: DetailsViewModelCapabilities!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateLoadingIndicator(show: true)
        setupViewModelObservers()
        viewModel.fetchMovieDetails(imdbId: "tt2395427")
    }
    
    private func setupViewModelObservers() {
        viewModel.refreshDetailsUI = { [weak self] in
            self?.refreshUI()
        }
    }
    
    private func refreshUI() {
        updateLoadingIndicator(show: false)
        if let url = viewModel.getMoviePosterUrl() {
            viewModel.setMoviePoster(forView: moviePosterImageView, url: url)
        }
        movieTitleLabel.text = viewModel.getMovieTitle()
        movieReleaseYearLabel.text = viewModel.getMovieReleaseYear()
        movieImdbRatingLabel.text = viewModel.getMovieImdbRating()
        movieGenreLabel.text = viewModel.getMovieGenre()
        movieEarningsLabel.text = viewModel.getMovieEarnings()
        moviePlotLabel.text = viewModel.getMoviePlot()
    }
    
    private func updateLoadingIndicator(show: Bool) {
        loadingIndicator.isHidden = !show
        if show {
            loadingIndicator.startAnimating()
        }
        else {
            loadingIndicator.stopAnimating()
        }
    }
}
