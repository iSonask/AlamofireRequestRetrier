//
//  MainViewModel.swift
//  AlamofireRequest
//
//  Created by Daljeet Singh on 06/05/20.
//  Copyright © 2020 Daljeet Singh. All rights reserved.
//

import Foundation

class ViewModel {
    
    weak var delegate: ViewStateProtocol?
    
    var state:ViewState = .initial{
        didSet {
            switch state {
            case .initial:
                delegate?.showInitial()
            case .loading:
                delegate?.showLoading()
            case .movieListReceived:
                delegate?.movieListReceived()
            case .movieListNotReceived(let msg):
                delegate?.movieListNotReceived(error: msg)
            case .hideLoading:
                delegate?.hideLoading()
            }
        }
    }
    var movieList = [MovieDetailModel]()
    
    init(delegate: ViewStateProtocol) {
        self.delegate = delegate
    }
    
    func viewLoaded() {
        state = .initial
    }
    
    func searchMovieFor( name: String) {
        
        state = .loading
        VMManager().getMovieList(for: name, completion: { (movies) in
            
            if let list = movies {
                self.movieList = list
                self.state = .hideLoading
                self.state = .movieListReceived
            }
            
        }) { (errorDesc) in
            self.state = .hideLoading
            self.state = .movieListNotReceived(error: errorDesc ?? NetworkError.defaultIssue.errorDescription)
        }
    }
    
}

