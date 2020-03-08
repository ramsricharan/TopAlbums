//
//  AlbumListView.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/8/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation
import UIKit

class AlbumListView {
    
    // MARK:- Properties
    private var rootView: UIView
    
    
    // MARK:- View Components
    // Table View
    lazy var albumsTableView: UITableView = {
        let tableView = UITableView()
        tableView.noAutoResizing()
        return tableView
    }()
    
    
    
    // MARK:- Init methods
    init(rootView: UIView) {
        self.rootView = rootView
        setup()
    }
    
    
    // MARK:- Helper Methods
    private func setup() {
        rootView.addSubview(albumsTableView)
        albumsTableView.topAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.topAnchor).isActive = true
        albumsTableView.leftAnchor.constraint(equalTo: rootView.leftAnchor).isActive = true
        albumsTableView.rightAnchor.constraint(equalTo: rootView.rightAnchor).isActive = true
        albumsTableView.bottomAnchor.constraint(equalTo: rootView.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
//        albumsTableView.rowHeight = UITableView.automaticDimension
//        albumsTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    
    public func reloadTableView() {
        DispatchQueue.main.async {
            self.albumsTableView.reloadData()
        }
    }
    
    
}
