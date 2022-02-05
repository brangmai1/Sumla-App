//
//  DownloadImage.swift
//  Sumla
//
//  Created by Brang Mai on 1/21/22.
//

import UIKit

extension UIImageView {
    func loadImage(url: URL) -> URLSessionDownloadTask {
        let downloadTask = URLSession.shared.downloadTask(with: url) {
            [weak self] url, _, error in
            
//            if error == nil {
//                if let url = url {
//                    if let data = try? Data(contentsOf: url) {
//                        if let image = UIImage(data: data) {
//                            DispatchQueue.main.async {
//                                if let weakSelf = self {
//                                    weakSelf.image = image
//                                }
//                            }
//                        }
//                    }
//                }
//            }
            
            if error == nil, let url = url, let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                
                DispatchQueue.main.async {
                    if let weakSelf = self {
                        weakSelf.image = image
                    }
                }
            }
        }
        downloadTask.resume()
        return downloadTask
    }
}
