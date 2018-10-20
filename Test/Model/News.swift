//
//  News.swift
//  Test
//
//  Created by Hussain.Chhatriwala on 10/18/18.
//  Copyright © 2018 Hussain.Chhatriwala. All rights reserved.
//

import Foundation

struct News: Codable {
    let copyright: String?
    let numResults: Int?
    let results: [Result]?
    let status: String?
    
    enum CodingKeys: String, CodingKey {
        case copyright
        case numResults = "num_results"
        case results
        case status
    }
}

struct Result: Codable {
    let abstractField: String?
    let adxKeywords: String?
    let assetId: Int?
    let byline: String?
    let column: String?
    let id: Int?
    let media: [Media]?
    let publishedDate: String?
    let section: String?
    let source: String?
    let title: String?
    let type: String?
    let url: String?
    let views: Int?
    
    enum CodingKeys: String, CodingKey {
        case abstractField = "abstract"
        case adxKeywords = "adx_keywords"
        case assetId = "asset_id"
        case byline
        case column
        case id
        case media
        case publishedDate = "published_date"
        case section
        case source
        case title
        case type
        case url
        case views
    }
}

struct Media: Codable {
    let approvedForSyndication: Int?
    let caption: String?
    let copyright: String?
    let mediametadata: [MediaMetadata]?
    let subtype: String?
    let type: String?
    
    enum CodingKeys: String, CodingKey {
        case approvedForSyndication = "approved_for_syndication"
        case caption
        case copyright
        case mediametadata = "media-metadata"
        case subtype
        case type
    }
}

import Foundation

struct MediaMetadata: Codable {
    let format: String?
    let height: Int?
    let url: String?
    let width: Int?
    
    enum CodingKeys: String, CodingKey {
        case format
        case height
        case url
        case width
    }
}
