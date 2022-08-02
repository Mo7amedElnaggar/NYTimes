//
//  ArticlesViewModelProtocol.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

protocol ArticlesViewModelDelegate: AnyObject {
    func didRecieveArticles(articles: MostPopularArticles)
    func didRecieveError(errMsg: String)
}
