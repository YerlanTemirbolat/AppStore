//
//  Service.swift
//  AppStore
//
//  Created by Yerlan on 15.12.2021.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    func fetchApps(searchTerm: String, completion: @escaping ([Result], Error?) -> ()) {
        
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let error = error {
                print("Failed to fetch apps:", error)
                completion([], nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let searchResult = try JSONDecoder().decode(SearchResult.self, from: data)
                
                //searchResult.results.forEach { print($0.trackName, $0.primaryGenreName) }
                
                completion(searchResult.results, nil)
                
            } catch let jsonError {
                print(jsonError)
                completion([], jsonError)
            }
        }.resume()
    }
    
    func fetchTopGrossing(completion: @escaping (AppGroup?, Error?) -> ()) {
       let urlString = "https://rss.applemarketingtools.com/api/v2/us/music/most-played/10/albums.json"
        
        fetchAppGroup(urlString: urlString, completion: completion)
    }
    
    func fetchGames(completion: @escaping (AppGroup?, Error?) -> ()) {
        fetchAppGroup(urlString: "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/10/apps.json", completion: completion)
    }
    
    // Helper
    func fetchAppGroup(urlString: String, completion: @escaping (AppGroup?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, err in
            
            if let err = err {
                completion(nil, err)
                return
            }
            
            do {
                let appGroup = try JSONDecoder().decode(AppGroup.self, from: data!)
                appGroup.feed.results.forEach { print($0.name) }
                completion(appGroup, nil)
                    
            } catch {
                completion(nil, error)
                //print("Failed: \(error)")
            }
        }.resume()
    }
}
