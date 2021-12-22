//
//  AppGroup.swift
//  AppStore
//
//  Created by Yerlan on 18.12.2021.
//

import Foundation

struct AppGroup: Codable {
    let feed: Feed
}

struct Feed: Codable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Codable {
    let id: String
    let name: String
    let artistName: String
    let artworkUrl100: String
}
