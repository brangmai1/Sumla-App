//
//  DataModel.swift
//  Sumla
//
//  Created by Brang Mai on 1/27/22.
//

import Foundation

class DataModel {
    
    var favoritedCollection = [FavoriteCollection]()
    
    var indexOfSelectedArkwork: Int {
        get {
            return UserDefaults.standard.integer(forKey: "ArtworkDataIndex")
        }
        set {
            UserDefaults.standard.set(newValue, forKey: "ArkworkDataIndex")
        }
    }
    
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("FavoriteColection.plist")
    }
    
    func saveArtworkData() {
        let encoder = PropertyListEncoder()
        do {
            let data = try encoder.encode(favoritedCollection)
            try data.write(to: dataFilePath(), options: Data.WritingOptions.atomic)
        } catch {
            print("Error encoding item array: \(error.localizedDescription)")
        }
    }
    
    func loadArtworkdData() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                favoritedCollection = try decoder.decode([FavoriteCollection].self, from: data)
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
    }
    
    func registerDefaults() {
        let dictionary = ["ArtworkDataIndex": -1, "FirstTime": true] as [String: Any]
        UserDefaults.standard.register(defaults: dictionary)
    }
    
    func handleFirstTime() {
        let userDefaults = UserDefaults.standard
        let firstTime = userDefaults.bool(forKey: "FirstTime")
        
        if firstTime {
            let artwork = FavoriteCollection(name: "Artwork")
            favoritedCollection.append(artwork)
            indexOfSelectedArkwork = 0
            userDefaults.set(false, forKey: "FirstTime")
        }
    }
        
    /*
       Book Title: UIKit Apprentice
       Authors: Fahim Farook, Matthijs Hollemans
       Code Version: Second Eddition
       Availability: https://www.raywenderlich.com/books/uikit-apprentice
       */
       func parseData(data: Data) -> [ArtworkData] {
           do {
               let decoder = JSONDecoder()
               let result = try decoder.decode(ArtworkCollectionData.self, from: data)
               return result.data
           } catch {
               print("JSON Error: \(error)")
               return []
           }
       }
    
    
    
}
