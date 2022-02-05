//
//  SearchViewController.swift
//  Sumla
//
//  Created by Brang Mai on 11/9/21.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
       
    @IBOutlet weak var tableView: UITableView!
    var selectedSearchName = ""
    let searchCategories = ["Artwork Title", "Artwork Type"]
    var selectedIndexPath = IndexPath()
    var selectedIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        for index in 0..<searchCategories.count {
//            if searchCategories[index] == selectedSearchName {
//                selectedIndexPath = IndexPath(row: index, section: 0)
//                break
//            }
//        }
//
//        print("Selected Name: \(selectedSearchName)")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchCategories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        let categoryName = searchCategories[indexPath.row]
        cell.textLabel!.text = categoryName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndexPath = indexPath
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
  
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SearchByTitle" {
            let controller = segue.destination as! SearchTitleViewController
            let artworkCollectionData = ArtworkCollectionData()
            controller.artworkData = artworkCollectionData.data
        }
    }

}

