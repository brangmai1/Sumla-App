//
//  FavoriteViewController.swift
//  Sumla
//
//  Created by Brang Mai on 1/22/22.
//

import UIKit

class FavoriteViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var artworkData = [ArtworkData]()
    var dataModel = DataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self

//        let layout = artworkCollection.collectionViewLayout as! UICollectionViewFlowLayout
//        let rulerTwo: CGFloat = 2
//        let rulerThree: CGFloat = 3
//        let rulerFive: CGFloat = 5
//
//        layout.minimumLineSpacing = rulerThree
//        layout.minimumInteritemSpacing = rulerThree
//
//        let width = (view.frame.size.width - layout.minimumInteritemSpacing * rulerFive) / rulerThree
//        layout.itemSize = CGSize(width: width, height: width * rulerThree / rulerTwo)
        
        let url = URL(string: "https://api.artic.edu/api/v1/artworks")!
        let requestArtworks = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let sessionArtworks = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let taskArtworks = sessionArtworks.dataTask(with: requestArtworks) { (data, response, error) in

            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                self.artworkData = self.dataModel.parseData(data: data)

                self.collectionView.reloadData()
//
//                DispatchQueue.main.async {
//                    self.collectionView.reloadData()
//                }
            }
        }
         taskArtworks.resume()
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return artworkData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteGridCell", for: indexPath) as! FavoriteGridCell
        let anArtwork = artworkData[indexPath.item]
        cell.configure(for: anArtwork)
        
        return cell
    }
    
    

        
}


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


