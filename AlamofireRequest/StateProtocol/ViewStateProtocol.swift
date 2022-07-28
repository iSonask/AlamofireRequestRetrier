//
//  ViewStateProtocol.swift
//  AlamofireRequest
//
//  Created by Daljeet Singh on 06/05/20.
//  Copyright © 2020 Daljeet Singh. All rights reserved.
//

import Foundation

enum ViewState {
    case initial
    case loading
    case hideLoading
    case movieListReceived
    case movieListNotReceived(error: String)
}

protocol ViewStateProtocol: class {
    
    func showInitial()
    func showLoading()
    func hideLoading()
    func movieListReceived()
    func movieListNotReceived(error: String)
}
