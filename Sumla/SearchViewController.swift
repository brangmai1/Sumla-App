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
    let searchCategories = ["Artwork ID", "Artwork Title", "Artist Name", "Artwork Type"]
    var selectedIndexPath = IndexPath()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        for index in 0..<searchCategories.count {
            if searchCategories[index] == selectedSearchName {
                selectedIndexPath = IndexPath(row: index, section: 0)
                break
            }
        }
        
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
    
    
    

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

