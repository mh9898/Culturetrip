//
//  NetworkManager.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit

class NetworkManager {
    static let shard = NetworkManager()
    private let baseURL = "https://cdn.theculturetrip.com/"
    let cache = NSCache<NSString, UIImage>()
    
    private init() {}
    
    
    func getArticles(completed: @escaping (Result<ArticlesData, CTError>) -> Void){
        
        let endPoint = baseURL + "home-assignment/response.json"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.domainError))
            return
        }
    
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
    
            if let _ = error{
                completed(.failure(.InternetError))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.dataError))
                return
            }
            
            guard let data = data else{
                completed(.failure(.dataError))
                return
            }
            
            
            do{
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let articlesData = try decoder.decode(ArticlesData.self, from: data)
                completed(.success(articlesData))
            } catch{
                completed(.failure(.decodingError))
            }
        }
    task.resume()
    }
}
