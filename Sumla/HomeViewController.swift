//
//  HomeViewController.swift
//  Sumla
//
//  Created by Brang Mai on 11/7/21.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
//    var artCollection = [String]()
    var artCollection = ArtCollectionData()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
//        let url = URL(string: "https://collectionapi.metmuseum.org/public/collection/v1/objects/555")!
//        let requestArtworks = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let sessionArtworks = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let taskArtworks = sessionArtworks.dataTask(with: requestArtworks) { (data, response, error) in
//
//            // This will run when the network request returns
//             if let error = error {
//                print(error.localizedDescription)
//             } else if let data = data {
//                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String]
//                 self.artCollection = dataDictionary
//                 print(self.artCollection)
////                 print("Name of the painting is \(self.artCollection["title"]!)")
//                 self.tableView.reloadData()
//
//                    // TODO: Get the array of movies
//                    // TODO: Store the movies in a property to use elsewhere
//                    // TODO: Reload your table view data
//            }
//        }
//        taskArtworks.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtCollectionCell") as! ArtCollectionCell
        let artCollectionData = ArtCollectionData()
//        let artObjectID = artCollectionData.objectID
//        let artObjectID = NSString(format:"%@", artCollectionData.objectID) as String
        let artTitle = artCollectionData.title
        let artCulture = artCollectionData.culture
        let artist = artCollectionData.artistDisplayName

        cell.titleLabel!.text = artTitle
//        cell.objectIDLabel!.text = artObjectID
        cell.cultureLabel!.text = artCulture
        if artist != "" {
            cell.artistLabel!.text = artist
        } else {
            cell.artistLabel!.text = "Unknown"            
        }
        
        
        return cell
    }
      
}
        
//        collectionView.delegate = self
//        collectionView.dataSource = self
        
//        // Create URL
//        let tokenUrl = URL(string:"https://api.artsy.net/api/tokens/xapp_token?client_id=b36d636fe061b6dab00f&client_secret=e480247eec66602f2687dc45ce95859a")!
//
//        // Create URL Request
//        var request = URLRequest(url: tokenUrl)
//
//        // Set HTTP Request Header
//        let header = ["Content-Type":"application/json"]
//        request.allHTTPHeaderFields = header
//
//        // Set HTTP Request Body
//        let jsonObject = ["type" : "xapp_token", "token" : "...",
//        "expires_at" : "2014-09-05T12:39:09.200Z"] as [String: Any]
//
//        do {
//            let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
//            request.httpBody = requestBody
//        } catch {
//            print("Request Body error")
//        }
//
//        // Specify HTTP Method to use
//        request.httpMethod = "POST"
//
//        // Get the URL session
//        let session = URLSession.shared
//
//        // Create the data task
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//
//            //Check if Error took place
//            if error == nil && data != nil {
//
//                //Parse JSON
//                do {
//                    let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
//
//                    self.tokens = dataDictionary["token"] as! String
//                    print("My token is \(self.tokens)")
//                }
//                catch {
//                    print("Error parsing response dat")
//                }
//            }
//        }
//        dataTask.resume()
        
//        let url = URL(string: "https://api.artsy.net/api/artworks?X-XAPP-Token:\(myToken)")!
//        let requestArtworks = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
//        let sessionArtworks = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
//        let taskArtworks = sessionArtworks.dataTask(with: requestArtworks) { (data, response, error) in
//
//            // This will run when the network request returns
//             if let error = error {
//                print(error.localizedDescription)
//             } else if let data = data {
//                 let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//                 //self.artCollection = dataDictionary["_embedded"] as! [[String:Any]]
//                 print(dataDictionary)
//
//                    // TODO: Get the array of movies
//                    // TODO: Store the movies in a property to use elsewhere
//                    // TODO: Reload your table view data
//            }
//        }
//        taskArtworks.resume()
    
        
//        let artworkUrl = URL(string: "https://api.artsy.net/api/artworks?X-XAPP-Token:\(tokens)")
//        var artworkRequest = URLRequest(url: artworkUrl!)
//        let artworkHeader = ["Content-Type":"application/json"]
//        artworkRequest.allHTTPHeaderFields = artworkHeader
//
//        do {
//            let artworkRequestBody = try JSONSerialization.data(withJSONObject: artworkObject, options: .fragmentsAllowed)
//            artworkRequest.httpBody = artworkRequestBody
//        } catch {
//            print("Request Body error")
//        }
//
//        // Specify HTTP Method to use
//        artworkRequest.httpMethod = "POST"
//
//        // Get the URL session
//        let artworkSession = URLSession.shared
//
//        // Create the data task
//        let artworkDataTask = artworkSession.dataTask(with: artworkRequest) { (data, response, error) in
//
//            //Check if Error took place
//            if error == nil && data != nil {
//
//                //Parse JSON
//                do {
//                    let dictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
//                    print(self.dictionary)
//                }
//                catch {
//                    print("Error parsing response dat")
//                }
//            }
//        }
//        artworkDataTask.resume()
//
//    }
    
//    func getToken() -> String {
//
//        var myToken: String = ""
//
//        // Create URL
//        let tokenUrl = URL(string:"https://api.artsy.net/api/tokens/xapp_token?client_id=b36d636fe061b6dab00f&client_secret=e480247eec66602f2687dc45ce95859a")
//
//        // Create URL Request
//        var request = URLRequest(url: tokenUrl!)
//
//        // Set HTTP Request Header
//        let header = ["Content-Type":"application/json"]
//        request.allHTTPHeaderFields = header
//
//        // Set HTTP Request Body
//        let jsonObject = ["type" : "xapp_token", "token" : "...",
//            "expires_at" : "2014-09-05T12:39:09.200Z"] as [String: Any]
//
//        do {
//            let requestBody = try JSONSerialization.data(withJSONObject: jsonObject, options: .fragmentsAllowed)
//            request.httpBody = requestBody
//        } catch {
//            print("Request Body error")
//        }
//
//        // Specify HTTP Method to use
//        request.httpMethod = "POST"
//
//        // Get the URL session
//        let session = URLSession.shared
//
//        // Create the data task
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//
//            //Check if Error took place
//            if error == nil && data != nil {
//
//                //Parse JSON
//                do {
//                    let dataDictionary = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! [String:Any]
//
//                    myToken = dataDictionary["token"] as! String
//                    print("My token is \(myToken)")
//                }
//                catch {
//                    print("Error parsing response dat")
//                }
//            }
//        }
//        dataTask.resume()
//        return myToken
//    }
//}
//
            
//            //Read HTTP Response Status code
//            if let response = response as? HTTPURLResponse {
//                print("Response HTTP Status code: \(response.statusCode)")
//            }
//
//            // Convert HTTP Response Data to JSON to struct
//            guard let data = data, error == nil else {
//                print("Response data string failed")
//                return
//            }

//            let jsonData = JSON.data(using: .utf8)
//            let dictionary =
//
//            do {
//                let dictionary = try! JSONDecoder().decode(Response.self, from: data)
//            } catch {
//                print("Failed to convert:  \(error.localizedDescription)")
//            }
//
//            DispatchQueue.main.async {
//                print(self.artworksCollection)
//            }
             
        
       
//        guard tokenUrl != nil else {
//            return
//        }
//
//        // Create URL Request
//        var request = URLRequest(url: url!)
//
//        // Specify HTTP Method to use
//        request.httpMethod = "GET"
//
//        // Set HTTP Request Header
//        let header = ["client_id":"b36d636fe061b6dab00f", "client_secret":"e480247eec66602f2687dc45ce95859a",
//                      "Content-Type":"application/json"]
//        request.allHTTPHeaderFields = header
//
////        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
////        request.setValue("application/json", forHTTPHeaderField: "Accept")
//
//
//        // Send HTTP Request
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request) { (data, response, error) in
//
//            //Check if Error took place
////            if error == nil && data != nil {
////
////                //Parse JSON
////                let decoder = JSONDecoder()
////                do{
////                    self.artworksCollection = try decoder.decode([Response].self, from: data!)
////                } catch {
////                    print(error.localizedDescription)
////                }
////            }
//
//            // Read HTTP Response Status code
//            if let response = response as? HTTPURLResponse {
//                print("Response HTTP Status code: \(response.statusCode)")
//            }
//
//            // Convert HTTP Response Data to JSON to struct
//            guard let data = data, error == nil else {
//                print("Response data string failed")
//                return
//            }
//
////            let jsonData = JSON.data(using: .utf8)
//            let dictionary =
//
//            do {
//                let dictionary = try! JSONDecoder().decode(Response.self, from: data)
//            } catch {
//                print("Failed to convert:  \(error.localizedDescription)")
//            }
//
////            DispatchQueue.main.async {
////                print(self.artworksCollection)
////            }
//        }
//        dataTask.resume()
//
//        }
//
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.artworksCollection.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtGridCell") as! ArtGridCell
//        let artwork = artworksCollection[indexPath.row]
//        let title = artworksCollection["title"] as! String
//        let synopsis = artworksCollection["overview"] as! String
//
//        cell.titleLabel!.text = title
//        cell.synopsisLabel.text = synopsis
//
//        let baseUrl = "https://image.tmdb.org/t/p/w500"
//        let posterPath = movie["poster_path"] as! String
//        let posterUrl = URL(string: baseUrl + posterPath)
//
//        cell.posterView.af_setImage(withURL: posterUrl!)
//        return cell
//        }
        

