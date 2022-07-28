//
//  MovieModel.swift
//  AlamofireRequest
//
//  Created by Daljeet Singh on 06/05/20.
//  Copyright © 2020 Daljeet Singh. All rights reserved.
//

import Foundation

struct MovieModel: Codable {
    var search: [MovieDetailModel]?
    var error: String?
    enum CodingKeys: String, CodingKey {
        case search = "Search"
        case error = "Error"
    }
}

struct MovieDetailModel: Codable {
    var title: String?
    var year: String?
    var imdbID: String?
    var type: String?
    var poster: String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID
        case type = "Type"
        case poster = "Poster"
    }
}
