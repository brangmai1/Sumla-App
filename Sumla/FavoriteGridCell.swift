//
//  FavoriteGridCell.swift
//  Sumla
//
//  Created by Brang Mai on 2/13/22.
//

import UIKit

class FavoriteGridCell: UICollectionViewCell {
    
    @IBOutlet weak var artworkView: UIImageView!
    
    var downloadTask: URLSessionDownloadTask?
    
    func configure(for artData: ArtworkData) {
        
        if let imageId = artData.image_id {
            let urlString = getUrlString(imageId: imageId)
            if let imageUrl = URL(string: urlString) {
                downloadTask = artworkView.loadImage(url: imageUrl)
            }
        }
    }
    
    func getUrlString(imageId: String) -> String {
        let stringUrl = "https://www.artic.edu/iiif/2/\(imageId)/full/200,/0/default.jpg"
        return stringUrl
    }
}
