//
//  HomeViewController.swift
//  Sumla
//
//  Created by Brang Mai on 11/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var artworksCollection = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        collectionView.delegate = self
        //        collectionView.dataSource = self

        // Create URL
        let stringUrl = URL(string: "https://api.artsy.net/api/artworks?client_id=b36d636fe061b6dab00f&&client_secret=e480247eec66602f2687dc45ce95859a")
       
        guard let url = stringUrl else {
            fatalError()
        }
        
        // Create URL Request
        var request = URLRequest(url: url)
        
        // Specify HTTP Method to use
        request.httpMethod = "GET"
        
        let header = ["client_id":"b36d636fe061b6dab00f", "client_secret":"e480247eec66602f2687dc45ce95859a",
                      "content_type":"application/json", "accept":"application/json"]
        
        // Set HTTP Request Header
//        request.setValue("client_id":"b36d636fe061b6dab00f", "client_secret":"e480247eec66602f2687dc45ce95859a")
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.allHTTPHeaderFields = header
        
//        request.setValue("e480247eec66602f2687dc45ce95859a", forHTTPHeaderField: "eyJhbGciOiJIUzI1NiJ9.eyJyb2xlcyI6IiIsInN1YmplY3RfYXBwbGljYXRpb24iOiI2MTYwNmRjZmZiZGUzMTAwMGQ5M2NhNDciLCJleHAiOjE2Mzc2MjI3NTEsImlhdCI6MTYzNzAxNzk1MSwiYXVkIjoiNjE2MDZkY2ZmYmRlMzEwMDBkOTNjYTQ3IiwiaXNzIjoiR3Jhdml0eSIsImp0aSI6IjYxOTJlOTVmODMxY2NmMDAwY2Y2ZjZhYyJ9.mnlf8pLJoFtNGc6dJh0FVV8eiLVCSNYz-KnKFCBc8pE")
        
        // Send HTTP Request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            //Check if Error took place
            if let error = error {
                print("Error took place \(error)")
                return
            }
            
            // Read HTTP Response Status code
            if let response = response as? HTTPURLResponse {
                print("Response HTTP Status code: \(response.statusCode)")
            }
            
            // Convert HTTP Response Data to JSON to struct
//            if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                print("Response data string: \(dataString)")
//            }
            if let error = error {
                print(error.localizedDescription)
            } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                print(dataDictionary)
            }
        }
        task.resume()
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

// Reference sources: https://developer.apple.com/forums/thread/682888
