//
//  ImageServiceProviderTests.swift
//  MovieAppTests
//
//  Created by Aashna Narula on 24/07/23.
//

import XCTest
@testable import MovieApp

class ImageServiceProviderTests: XCTestCase {
    var imageServiceProvider: ImageServiceProviding!
    let validImageUrl = "https://www.freepnglogos.com/uploads/microsoft-window-logo-emblem-0.png"
    let invalidImageUrl = "https://www.google.com"
    
    override func setUpWithError() throws {
        imageServiceProvider = ImageServiceProvider()
    }
    
    override func tearDownWithError() throws {
        imageServiceProvider = nil
    }
}
