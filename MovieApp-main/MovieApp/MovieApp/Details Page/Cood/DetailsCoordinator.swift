//
//  DetailsCoordinator.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation
import UIKit

protocol DetailsOnLoadDataProviding {
    var imdbId: String { get }
}

class DetailsCoordinator: Coordinator {
    
    var onLoadDataProvider: DetailsOnLoadDataProviding
    var navigationController: UINavigationController
    
    init(onLoadDataProvider: DetailsOnLoadDataProviding, navigationController: UINavigationController) {
        self.onLoadDataProvider = onLoadDataProvider
        self.navigationController = navigationController
    }
    
    func start() {
        let requestProvider = DetailsRequestProvider(imdbId: onLoadDataProvider.imdbId)
        let imageServiceProvider = ImageServiceProvider()
        let webServiceProvider = DetailsWebServiceProvider(requestProvider: requestProvider)
        let dbServiceProvider = DetailsDbServiceProvider()
        let dataServiceProvider = DetailsDataServiceProvider(webServiceProvider: webServiceProvider, dbServiceProvider: dbServiceProvider)
        let viewModel = DetailsViewModel(onLoadDataProvider: onLoadDataProvider, dataServiceProvider: dataServiceProvider, imageServiceProvider: imageServiceProvider)
        let viewController = DetailsViewController.instantiate()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}
