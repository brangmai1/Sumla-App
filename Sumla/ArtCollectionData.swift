//
//  ArtCollectionData.swift
//  Sumla
//
//  Created by Brang Mai on 12/6/21.
//

import Foundation

class ArtworkCollectionData: NSObject, Codable {
    var data = [ArtworkData]()
}

class ArtworkData: NSObject, Codable {
    var id: Int?
    var title: String?
    var artist_display: String?
    var place_of_origin: String?
    var dimensions: String?
    var medium_display: String?
    var publication_history: String?
    var provenance_text: String?
    var department_title: String?
    var artist_title: String?
    var image_id: String?
    
   
}
