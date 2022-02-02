//
//  FavoriteCollection.swift
//  Sumla
//
//  Created by Brang Mai on 1/27/22.
//

import Foundation
import UIKit

class FavoriteCollection: NSObject, Codable {
    var name = ""
    var artworks = [ArtworkData]()
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
