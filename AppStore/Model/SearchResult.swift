//
//  SearchResult.swift
//  AppStore
//
//  Created by Yerlan on 15.12.2021.
//

import Foundation

struct SearchResult: Codable {
    let resultCount: Int
    let results: [Result]
}

struct Result: Codable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String
    var averageUserRating: Float?
    var screenshotUrls: [String]?
    let artworkUrl100: String
    let formattedPrice: String?
    var description: String?
    let releaseNotes: String?
    var artistName: String?
    var collectionName: String?
}
