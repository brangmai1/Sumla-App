//
//  SearchedResultsTableViewController.swift
//  Sumla
//
//  Created by Brang Mai on 2/1/22.
//

import UIKit

class SearchTitleViewController: UITableViewController {
    var artworkData = [ArtworkData]()
    var dataModel = DataModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Source code: https://courses.codepath.org/courses/ios_university/unit/1#!assignment        
        let url = URL(string: "https://api.artic.edu/api/v1/artworks")!
        let requestArtworks = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let sessionArtworks = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let taskArtworks = sessionArtworks.dataTask(with: requestArtworks) { (data, response, error) in

            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                self.artworkData = self.dataModel.parseData(data: data)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
         taskArtworks.resume()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artworkData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell", for: indexPath)
        let title = artworkData[indexPath.row].title
        if title != ""{
            cell.textLabel!.text = title
        } else {
            cell.textLabel!.text = "No Title"
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let cell = sender as! UITableViewCell
     let indexPath = tableView.indexPath(for: cell)!
     let artwork = artworkData[indexPath.row]
     
     // Pass the selected artwork to the details view controller
     let artworkDetailsViewController = segue.destination as! ArtworkDetailsViewController
     artworkDetailsViewController.artwork = artwork
     
     artworkDetailsViewController.hidesBottomBarWhenPushed = true
     tableView.deselectRow(at: indexPath, animated: true)
    }
}

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    



