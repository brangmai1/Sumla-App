//
//  ArtCollectionCell.swift
//  Sumla
//
//  Created by Brang Mai on 12/5/21.
//

import UIKit
import CoreData

class ArtCollectionCell: UITableViewCell {
    
    var managedObjectContext: NSManagedObjectContext!
    
    @IBOutlet weak var artView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var departmentTitleLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    var downloadTask: URLSessionDownloadTask?
    
    var favorited: Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    @IBAction func favoriteArt(_ sender: Any) {
        let toBeFavorited = !favorited
        if toBeFavorited {
            self.setFavorite(true)
        } else {
            self.setFavorite(false)
        }
    }
    func setFavorite(_ isFavorited: Bool) {
        favorited = isFavorited
        if (favorited) {
            favoriteButton.setImage(UIImage(named: "love"), for: UIControl.State.normal)
        } else {
            favoriteButton.setImage(UIImage(named: "unlove"), for: UIControl.State.normal)
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(for artData: ArtworkData) {
        titleLabel!.text = artData.title
        if artData.artist_title != "" {
            artistLabel!.text = artData.artist_display
        } else {
            artistLabel!.text = "Unknown"
        }
        typeLabel!.text = artData.medium_display
        departmentTitleLabel!.text = artData.department_title
        
        if let imageId = artData.image_id {
            let urlString = getUrlString(imageId: imageId)
            if let imageUrl = URL(string: urlString) {
                downloadTask = artView.loadImage(url: imageUrl)
            }
        }
    }
    
    func getUrlString(imageId: String) -> String {
        let stringUrl = "https://www.artic.edu/iiif/2/\(imageId)/full/200,/0/default.jpg"
        return stringUrl
    }
}

