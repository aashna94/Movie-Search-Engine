//
//  ModelConvertible.swift
//  MovieApp
//
//  Created by Aashna Narula on 23/07/23.
//

import Foundation

protocol ModelConvertible {
    
    associatedtype Model
    func toModel() -> Model?
}
