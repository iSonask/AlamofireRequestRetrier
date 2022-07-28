//
//  LoaderView.swift
//  AlamofireRequest
//
//  Created by Daljeet Singh on 07/05/20.
//  Copyright © 2020 Daljeet Singh. All rights reserved.
//

import Foundation
import SwiftSpinner

struct LoaderView {
    
    static let shared = LoaderView()
    
    func showLoadingView() {
        SwiftSpinner.show(Messages.loading)
    }
    
    func hideLoadingView() {
        SwiftSpinner.hide()
    }
}
