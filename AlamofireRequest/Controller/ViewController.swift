//
//  ViewController.swift
//  AlamofireRequest
//
//  Created by Daljeet Singh on 03/05/20.
//  Copyright © 2020 Daljeet Singh. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    @IBOutlet weak var movieBtn: UIButton!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var movieTable: UITableView!
    
    lazy var vModel = ViewModel(delegate: self)
    
    var movies = [MovieDetailModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        movieBtn.layer.cornerRadius = 5
        movieBtn.layer.borderWidth = 1
        movieBtn.layer.borderColor = UIColor.black.cgColor
        
        vModel.viewLoaded()
    }
    
    @IBAction func searchyourMovie() {
        if let movieName = searchTF.text, !movieName.isEmpty {
            searchTF.resignFirstResponder()
            vModel.searchMovieFor(name: movieName)
        }
    }
}

extension ViewController: ViewStateProtocol {
    
    func showInitial() {
        movieTable.isHidden = true
    }
    
    func showLoading() {
        LoaderView.shared.showLoadingView()
    }
    
    func hideLoading() {
        LoaderView.shared.hideLoadingView()
    }
    
    func movieListReceived() {
        movies = vModel.movieList
        movieTable.reloadData()
        movieTable.isHidden = false
    }
    
    func movieListNotReceived(error: String) {
        movieTable.isHidden = true
        movies.removeAll()
        print("error")
        showAlert(message: error)
    }
    
    func showAlert(message: String) {
        CustomAlert.displayAlertWith(title: nil, message: message, btnTitle: Messages.Okay)
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create a new cell if needed or reuse an old one
        let cellReuseIdentifier = "cell"
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        // set the text from the data model
        cell.textLabel?.text = movies[indexPath.row].title
        return cell
    }
    
    
}
