//
//  ViewModelManager.swift
//  AlamofireRequest
//
//  Created by Daljeet Singh on 06/05/20.
//  Copyright © 2020 Daljeet Singh. All rights reserved.
//

import Foundation

struct VMManager {
    
    typealias SuccessHandler = (_ response: [MovieDetailModel]?) -> ()
    typealias FailureHandler = (_ error: String?) -> ()
    
    func prepareUrlString()->String {
        
        let urlString = Constants.apiUrl + "apiKey=\(Constants.apiKey)"
        return urlString
    }
    
    func getMovieList(for search: String, completion: @escaping SuccessHandler, failure: @escaping FailureHandler) {
        let urlString = prepareUrlString()
        
        let urlWithParam = "\(urlString)&s=\(search)"
        print("urlWithParam \(urlWithParam)")
        
        ApiManager.postApiCall(url: urlWithParam, success: { (data) in
            
            let string = String(data: data, encoding: .utf8)
            
            print("Response -\(string ?? "")")
            data.responseJSONCodable(for: MovieModel.self, completion: { model in
                if let movies = model.search, movies.count > 0 {
                    completion(movies)
                } else {
                    if let errorMsg = model.error {
                        failure(errorMsg)
                    } else {
                        failure(NetworkError.runtime(Messages.noMovies).errorDescription)
                    }
                }
            }, failure: {(error) in
                failure(error.errorDescription)
            })
        }) { error in
            
            failure(error.errorDescription)
        }
    }
}
