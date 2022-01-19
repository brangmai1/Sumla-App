//
//  HomeViewController.swift
//  Sumla
//
//  Created by Brang Mai on 11/7/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var artCollection = [String]()
    var artworkData = [ArtworkData]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        let url = URL(string: "https://api.artic.edu/api/v1/artworks")!
        let requestArtworks = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let sessionArtworks = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let taskArtworks = sessionArtworks.dataTask(with: requestArtworks) { (data, response, error) in

            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                self.artworkData = self.parseData(data: data)
                for art in self.artworkData {
                    print(art.title!)
                }

                       }
                   }
                   taskArtworks.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtCollectionCell") as! ArtCollectionCell
//        let artCollectionData = ArtCollectionData()
//
//        let artTitle = artCollectionData.title
//        let artCulture = artCollectionData.culture
//        let artist = artCollectionData.artistDisplayName
//
//        cell.titleLabel!.text = artTitle
//        cell.cultureLabel!.text = artCulture
//        if artist != "" {
//            cell.artistLabel!.text = artist
//        } else {
//            cell.artistLabel!.text = "Unknown"
//        }
//
        
        return cell
    }
    
    /*
       Book Title: UIKit Apprentice
       Authors: Fahim Farook, Matthijs Hollemans
       Code Version: Second Eddition
       Availability: https://www.raywenderlich.com/books/uikit-apprentice
       */
       func parseData(data: Data) -> [ArtworkData] {
           do {
               let decoder = JSONDecoder()
               let result = try decoder.decode(ArtworkCollectionData.self, from: data)
               return result.data
           } catch {
               print("JSON Error: \(error)")
               return []
           }
       }

      
}
        
