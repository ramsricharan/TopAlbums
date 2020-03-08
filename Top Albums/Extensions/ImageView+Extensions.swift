//
//  ImageView+Extensions.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/8/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation
import UIKit

let imageCache = NSCache<AnyObject, AnyObject>()

extension UIImageView
{
    func loadImageFrom(url imageURL: String) {
        self.image = nil
        
        if let imageFromCache = imageCache.object(forKey: imageURL as AnyObject) as? UIImage {
            self.image = imageFromCache
            return
        }
        
        if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if(error == nil) {
                    if let data = data {
                        DispatchQueue.main.async() {
                            let imageToCache = UIImage(data: data)
                            imageCache.setObject(imageToCache!, forKey: imageURL as AnyObject)
                            self.image = imageToCache
                        }
                    } else {
                        print(error ?? "Unable to download the image")
                    }
                }
                else {
                    print(error! as NSError)
                    print("Unable to load the image for: \(imageURL)")
                }
                }.resume()
        }
    }
}
