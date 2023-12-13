//
//  SearchTableViewCell.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import UIKit

protocol SearchTableViewCellDataProviding {
    var title: String { get }
    var year: String { get }
    var posterUrl: String { get }
}

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var movieReleaseYearLabel: UILabel!
    @IBOutlet weak var moviePosterImageView: ImageServiceProvider!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieTitleLabel.text = nil
        movieReleaseYearLabel.text = nil
        moviePosterImageView.image = nil
    }
    
    func configure(withDataProvider dataProvider: SearchTableViewCellDataProviding,
                   andImageServiceProvider imageServiceProvider: MoviePosterImageDownloader) {
        movieTitleLabel.text = dataProvider.title
        movieReleaseYearLabel.text = "Release Year: \(dataProvider.year)"
        imageServiceProvider.setMoviePoster(forView: moviePosterImageView, url: dataProvider.posterUrl)
    }
}
