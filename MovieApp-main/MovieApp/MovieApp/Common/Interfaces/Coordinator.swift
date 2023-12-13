//
//  Coordinator.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    func start()
}

