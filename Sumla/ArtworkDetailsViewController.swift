//
//  ArtworkDetailViewController.swift
//  Sumla
//
//  Created by Brang Mai on 1/26/22.
//

import UIKit

class ArtworkDetailsViewController: UIViewController {
    var artwork: ArtworkData!
    var downloadTask: URLSessionDownloadTask?

    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artworkLargeView: UIImageView!
    @IBOutlet weak var dimensionLabel: UILabel!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var mediumDisplayLabel: UILabel!
    @IBOutlet weak var artworkTypeLabel: UILabel!
    @IBOutlet weak var styleTitleLabel: UILabel!
    @IBOutlet weak var provenanceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure(for: artwork)
    }
    
    func configure(for artData: ArtworkData) {
        
        titleLabel!.text = artData.title
        
        if let imageId = artwork.image_id {
            let urlString = getUrlString(imageId: imageId)
            if let imageUrl = URL(string: urlString) {
                downloadTask = artworkLargeView.loadImage(url: imageUrl)
            }
        }
        artistLabel!.text = artData.artist_display
        dimensionLabel!.text = artData.dimensions
        originLabel!.text = artData.place_of_origin
        artworkTypeLabel!.text = artData.artwork_type_title
        if artData.medium_display != nil {
            styleTitleLabel!.text = artData.style_title
        } else {
            styleTitleLabel.text = "Unknown"
        }
        if artData.provenance_text != nil {
            provenanceLabel!.text = artData.provenance_text
        } else {
            provenanceLabel.text = "Unknown"
        }
    }
    
    func getUrlString(imageId: String) -> String {
        let stringUrl = "https://www.artic.edu/iiif/2/\(imageId)/full/400,/0/default.jpg"
        return stringUrl
    }
}
