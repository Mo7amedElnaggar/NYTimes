//
//  Article.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

struct Article: Codable {
    let uri: String
    let url: String
    let id, assetID: Int
    let source: String
    let publishedDate, updated, section, subsection: String
    let nytdsection, adxKeywords: String
    let byline: String
    let type: String
    let title, abstract: String
    let desFacet, orgFacet, perFacet, geoFacet: [String]
    let media: [ArticleMedia]
    let etaID: Int

    enum CodingKeys: String, CodingKey {
        case uri, url, id
        case assetID = "asset_id"
        case source
        case publishedDate = "published_date"
        case updated, section, subsection, nytdsection
        case adxKeywords = "adx_keywords"
        case byline, type, title, abstract
        case desFacet = "des_facet"
        case orgFacet = "org_facet"
        case perFacet = "per_facet"
        case geoFacet = "geo_facet"
        case media
        case etaID = "eta_id"
    }
}
