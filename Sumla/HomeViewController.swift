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
                
                // Testing data
//                for art in self.artworkData {
//                    print("\nArtwork title: \(art.title!)")
//                    print("Artist: \(art.artist_title!)")
//                }
//
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
         taskArtworks.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artworkData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtCollectionCell") as! ArtCollectionCell
//        cell.titleLabel!.text = artworkData[indexPath.row].title
//        cell.artistLabel!.text = artworkData[indexPath.row].artist_title
        let anArtwork = artworkData[indexPath.row]
        cell.configure(for: anArtwork)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        //Find the selected artwork
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let artwork = artworkData[indexPath.row] 
        
        // Pass the selected artwork to the details view controller
        let artworkDetailsViewController = segue.destination as! ArtworkDetailsViewController
        artworkDetailsViewController.artwork = artwork
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
        
