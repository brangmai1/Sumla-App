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

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artworkLargeView: UIImageView!
    
    @IBOutlet weak var publicationHistoryLabel: UILabel!
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
        
        publicationHistoryLabel!.text = artData.publication_history
    }
    
    func getUrlString(imageId: String) -> String {
        let stringUrl = "https://www.artic.edu/iiif/2/\(imageId)/full/1686,/0/default.jpg"
        return stringUrl
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
