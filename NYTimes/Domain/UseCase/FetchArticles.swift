//
//  FetchArticles.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 02/08/2022.
//  Copyright © 2022 Mohamed El-Naggar. All rights reserved.
//

import Foundation

protocol FetchArticlesUseCase {
    func fetch(completion: (([Article]) -> Void)?)
}

class FetchArticles: FetchArticlesUseCase {

    private let service: APIService
    
    init(service: APIService = APIService.shared) {
        self.service = service
    }
    
    func fetch(completion: (([Article]) -> Void)?) {
        service.getData { (mostArticles: MostPopularArticles) in
            completion?(mostArticles.articles)
        } onFailure: { error in /* Do something */ }
    }
}
