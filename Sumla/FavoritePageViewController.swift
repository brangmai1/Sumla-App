//
//  FavoritePageViewController.swift
//  Sumla
//
//  Created by Brang Mai on 11/9/21.
//

import UIKit

class FavoritePageViewController: UIViewController {
//    UICollectionViewDataSource, UICollectionViewDelegate

    @IBOutlet weak var favoriteCollectionView: UICollectionView!
    
    var artworks = [String:Any]()
    var art_title: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
        let layout = favoriteCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let rulerTwo: CGFloat = 2
        let rulerThree: CGFloat = 3
        let rulerFive: CGFloat = 5
        
        layout.minimumLineSpacing = rulerThree
        layout.minimumInteritemSpacing = rulerThree
        
        let width = (view.frame.size.width - layout.minimumInteritemSpacing * rulerFive) / rulerThree
        layout.itemSize = CGSize(width: width, height: width * rulerThree / rulerTwo)
        
        let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/objects/500")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                    
                 self.art_title = dataDictionary["title"] as! String
                 
                //self.favoriteCollectionView.reloadData()
                 print("The title of the painting is '\(self.art_title)'")
             }
        }
        task.resume()
    }
}
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return artworks.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

