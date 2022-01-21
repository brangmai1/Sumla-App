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
            artistLabel!.text = artData.artist_title
        } else {
            artistLabel!.text = "Unknown"
        }
    }
    
//    func configure(for ) {
//        nameLabel.text = result.name
//
//        if result.artist.isEmpty {
//            artistNameLabel.text = "Unknown"
//        } else {
//            artistNameLabel.text = String(format: "%@ (%@)", result.artist, result.type)
//        }
//
//        artworkImageView.image = UIImage(systemName: "square")
//        if let smallURL = URL(string: result.imageSmall) {
//            downloadTask = artworkImageView.loadImage(url: smallURL)
//        }
//    }

}
