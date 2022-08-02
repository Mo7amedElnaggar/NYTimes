//
//  ArticleMedia.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

struct ArticleMedia: Codable {
    let type: String
    let subtype: String
    let caption, copyright: String
    let approvedForSyndication: Int
    let mediaMetadata: [ArticleMediaMetadata]

    enum CodingKeys: String, CodingKey {
        case type, subtype, caption, copyright
        case approvedForSyndication = "approved_for_syndication"
        case mediaMetadata = "media-metadata"
    }
}
