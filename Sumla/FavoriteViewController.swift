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
        
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            
        }
        
        self.showAlert()
        

//        let layout = artworkData.collectionViewLayout as! UICollectionViewFlowLayout
//        let rulerTwo: CGFloat = 2
//        let rulerThree: CGFloat = 3
//        let rulerFive: CGFloat = 5
//
//        layout.minimumLineSpacing = rulerThree
//        layout.minimumInteritemSpacing = rulerThree
//
//        let width = (view.frame.size.width - layout.minimumInteritemSpacing * rulerFive) / rulerThree
//        layout.itemSize = CGSize(width: width, height: width * rulerThree / rulerTwo)
        

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
    
    
    func showAlert() {
        let alert = UIAlertController(title: "Alert", message: "No favorite art is saved.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
            print("No favorite alert")
        }))
        
        present(alert, animated: true, completion: nil)
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


