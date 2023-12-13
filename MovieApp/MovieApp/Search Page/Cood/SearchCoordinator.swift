//
//  SearchCoordinator.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import UIKit

protocol DetailsPageNavigating {
    func navigateToDetailsPage(data: DetailsOnLoadDataProviding)
}

struct SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = SearchViewController.instantiate()
        let searchRequestProvider = SearchRequestProvider()
        let imageServiceProvider = ImageServiceProvider()
        let searchWebServiceProvider = SearchWebServiceProvider(requestProvider: searchRequestProvider, queryStringUpdater: searchRequestProvider)
        let viewModel = SearchViewModel(searchWebServiceProvider: searchWebServiceProvider, imageServiceProvider: imageServiceProvider)
        viewController.viewModel = viewModel
        viewController.coordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
}

extension SearchCoordinator: DetailsPageNavigating {
    
    func navigateToDetailsPage(data: DetailsOnLoadDataProviding) {
        let detailsCoordinator = DetailsCoordinator(onLoadDataProvider: data, navigationController: navigationController)
        detailsCoordinator.start()
    }
}
