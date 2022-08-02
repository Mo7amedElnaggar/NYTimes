//
//  ArticleMediaMetadata.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

struct ArticleMediaMetadata: Codable {
    let url: String
    let format: Format
    let height, width: Int
}
