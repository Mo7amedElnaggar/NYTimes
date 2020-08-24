//
//  ArticlesViewModel.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

class ArticlesViewModel {
    
    var delegate: ArticlesViewModelDelegate?
    var mostPopularArticles: MostPopularArticles?
    
    func fetchData() {
        
        APIService.shared.getData(onSuccess: { (mostPopArt: MostPopularArticles) in
            self.mostPopularArticles = mostPopArt
            self.delegate?.didRecieveArticles(articles: mostPopArt)
        }) { (err: Error) in
            self.delegate?.didRecieveError(errMsg: err.localizedDescription)
        }
        
    }
    
}
