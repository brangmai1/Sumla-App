//
//  FavoriteViewController.swift
//  Sumla
//
//  Created by Brang Mai on 1/22/22.
//

import UIKit

class FavoriteViewController: UIViewController { // , UITableViewDataSource, UITableViewDelegate
    
    var favoriteCollection: FavoriteCollection!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        print("Favorite Item count: \(favoriteCollection.artworks.count)")
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print("Item count \(favoriteCollection.artworks.count)")
//        return favoriteCollection.artworks.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
