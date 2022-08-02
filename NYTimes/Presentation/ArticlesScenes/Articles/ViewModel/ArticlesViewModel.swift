//
//  ArticlesViewModel.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

protocol ArticlesViewModelDelegate: AnyObject {
    func didRecieveArticles()
    func didRecieveError(errMsg: String)
}

class ArticlesViewModel {
    
    weak var delegate: ArticlesViewModelDelegate?
    var articles: [Article]?
    private let useCase: FetchArticlesUseCase
    
    init(useCase: FetchArticlesUseCase) {
        self.useCase = useCase
    }
    
    init() {
        self.useCase = FetchArticles()
    }
    
    func fetchData() {
        useCase.fetch { [weak self] (articles) in
            self?.articles = articles
            self?.delegate?.didRecieveArticles()
        }
    }
}
