//
//  ViewController.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/7/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import UIKit

class AlbumListVC: UIViewController {
    
    // MARK:- Properties
    let tableViewCellID = "CellID"
    
    var viewTitle:String = "" {
        didSet {
            DispatchQueue.main.async {
                self.navigationItem.title = self.viewTitle
            }
        }
    }
    
    var albumListViewModals = [AlbumListViewModal]() {
        didSet {
            self.albumListView.reloadTableView()
        }
    }
    
    let apiClient = AlbumsAPIClient()
    var albumListView: AlbumListView!


    // MARK:- Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Fetch the Data
        setupViewModal()

        // Setup Views
        self.view.backgroundColor = .white
        

        albumListView = AlbumListView(rootView: self.view)
        albumListView.albumsTableView.delegate = self
        albumListView.albumsTableView.dataSource = self
        albumListView.albumsTableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: tableViewCellID)
        
    }

    
    // MARK:- Helper Methods
    func setupViewModal() {
        apiClient.fetchTopAlbums(success: { (data) in
            
            if let feed = data.feed {
                self.viewTitle = feed.title ?? "Albums"
                if let albumsList = feed.results {
                    self.albumListViewModals = albumsList.map({ (album) -> (AlbumListViewModal) in
                        return AlbumListViewModal(Album: album)
                    })
                }
                
            }
        }) { (error) in
            // Handle error
            print(error)
        }
        
    }

}




extension AlbumListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.albumListViewModals.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID, for: indexPath) as? AlbumTableViewCell else {
            let c = UITableViewCell(style:UITableViewCell.CellStyle.subtitle, reuseIdentifier:tableViewCellID)
            c.textLabel?.text = "Error"
            return c
        }

        let album = albumListViewModals[indexPath.row]
        cell.albumArtImageView.loadImageFrom(url: album.thumbnailURL)
        cell.titleLabel.text = album.albumName

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Tapped on \(albumListViewModals[indexPath.row].albumName)")
    }
    
    
}

