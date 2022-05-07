//
//  HomeViewController.swift
//  Sumla
//
//  Created by Brang Mai on 11/7/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var artworkData = [ArtworkData]()
    var dataModel = DataModel()
    
//    var fetchMoreData = false
//    var numberOfArt: Int! = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.apiCaller()
        
    }
    
    func apiCaller() {
        // Source code: https://courses.codepath.org/courses/ios_university/unit/1#!assignment
        let url = URL(string: "https://api.artic.edu/api/v1/artworks")!
        let requestArtworks = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let sessionArtworks = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let taskArtworks = sessionArtworks.dataTask(with: requestArtworks) { (data, response, error) in

            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                self.artworkData = self.dataModel.parseData(data: data)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
         taskArtworks.resume()

    }
    
//    func loadMoreArtworks() {
//        numberOfArt += 12
//        apiCaller()
//    }
    
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row + 1 == artworkData.count {
//            loadMoreArtworks()
//        }
//    }
    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artworkData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtCollectionCell") as! ArtCollectionCell

        let anArtwork = artworkData[indexPath.row]
        cell.configure(for: anArtwork)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        let offsetY = scrollView.contentOffset.y
//        let contentHeight = scrollView.contentSize.height
//
//        if offsetY > contentHeight - scrollView.frame.height {
////            print("Begin Batch Fetch")
//            if !fetchMoreData {
//                beginBatchFetch()
//            }
//        }
//    }
//
//    func beginBatchFetch() {
//        fetchMoreData = true
//        apiCaller()
//
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//        self.fetchMoreData = false
//        self.tableView.reloadData()
////        print("Begin Batch Fetch")
////
////        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
////            <#code#>
////        }
//    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //Find the selected artwork
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let artwork = artworkData[indexPath.row] 
        
        // Pass the selected artwork to the details view controller
        let artworkDetailsViewController = segue.destination as! ArtworkDetailsViewController
        artworkDetailsViewController.artwork = artwork
//        artworkDetailsViewController.favdelegate = self
        
        artworkDetailsViewController.hidesBottomBarWhenPushed = true
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//extension HomeViewController: FavoriteScreenDelegate {
//    func didTapFavorite(alert: UIAlertController) {
//        let alert = UIAlertController(title: "Alert", message: "You have an alert", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
//            print("Alert notify")
//        }))
//        present(alert, animated: true)
//    }
//}

extension HomeViewController: favoritedDelegate {
    func didTapAddFavorite(color: UIColor) {
        view.backgroundColor = color
    }
}
        
