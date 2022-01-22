//
//  ArtCollectionCell.swift
//  Sumla
//
//  Created by Brang Mai on 12/5/21.
//

import UIKit

class ArtCollectionCell: UITableViewCell {
    
    @IBOutlet weak var artView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var provenanceLabel: UILabel!
    
    var downloadTask: URLSessionDownloadTask?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(for artData: ArtworkData) {
        titleLabel!.text = artData.title
        if artData.artist_title != "" {
            artistLabel!.text = artData.artist_display
        } else {
            artistLabel!.text = "Unknown"
        }
        typeLabel!.text = artData.medium_display
        provenanceLabel!.text = artData.provenance_text
        
        let imageId = artData.image_id
        let urlString = getUrlString(imageId: imageId!)
        if let imageUrl = URL(string: urlString) {
            downloadTask = artView.loadImage(url: imageUrl)
        }
    }
    
    func getUrlString(imageId: String) -> String {
        let stringUrl = "https://www.artic.edu/iiif/2/\(imageId)/full/843,/0/default.jpg"
        return stringUrl
    }
}
