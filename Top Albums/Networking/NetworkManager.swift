//
//  NetworkManager.swift
//  Top Albums
//
//  Created by Ram Sri Charan on 3/7/20.
//  Copyright © 2020 Ram' Apps. All rights reserved.
//

import Foundation


enum ErrorMessages : String {
    case Generic = "Oops. Something went wrong."
    case NoData = "Sorry, couldn't fetch the data from the server."
}


class NetworkManager {
    
    // MARK:- Properties
    static var sharedInstance: NetworkManager = NetworkManager()
    
    private init() {}
    
    
    // MARK:- Utility Methods
    // Fetch the data from given URL and parse it into specified object
    public func getData<T:Decodable>(fromURL: String, successHandler: @escaping (T) -> Void, errorHandler: @escaping (String) -> Void ) {
        if let url = URL(string: fromURL) {
            
            let task = URLSession.shared.dataTask(with: url) { (data,response,error) in
                
                if let error = error as NSError? {
                    errorHandler(error.localizedDescription)
                    return
                }
                if self.isSuccessCode(response) {
                    guard let data = data else {
                        errorHandler(ErrorMessages.NoData.rawValue)
                        return
                    }
                    if let obj =  try? JSONDecoder().decode(T.self, from: data) {
                        successHandler(obj)
                        return
                    }
                }
                errorHandler(ErrorMessages.Generic.rawValue)
            }
            task.resume()
        }
    }
    
    
    // MARK:- Helper Methods
    private func isSuccessCode(_ statusCode: Int) -> Bool {
        return statusCode >= 200 && statusCode < 300
    }
    
    private func isSuccessCode(_ response: URLResponse?) -> Bool {
        guard let urlResponse = response as? HTTPURLResponse else {
            return false
        }
        return isSuccessCode(urlResponse.statusCode)
    }
    
    
}
