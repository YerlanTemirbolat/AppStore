//
//  Reviews.swift
//  AppStore
//
//  Created by Yerlan on 26.12.2021.
//

import Foundation

struct Reviews: Codable {
    let feed: ReviewFeed
}

struct ReviewFeed: Codable {
    let link: [Link]
}

struct Link: Codable {
    let rel: String
    let href: String
}
