//
//  APIService.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

typealias SuccessBlock<T: Decodable> = ((T) -> Void)
typealias FailureBlock = ((Error) -> Void)

class APIService {
    static let shared = APIService()
    
    private let network: Network = Network()
    private let baseURL: String = Constants.APIUrl

    func getData<T: Decodable>(onSuccess: @escaping SuccessBlock<T> , onFailure: @escaping FailureBlock) {
        let urlString: String = baseURL + "?api-key=\(Constants.APIKey)"
        guard let url = URL(string: urlString) else { return }

        network.dataTask(url: url) { (result) in
            switch(result) {
            case .failure(let err):
                onFailure(err)
            case .success(let (data, _)):
                guard let data = data else {
                      onFailure(CustomError.dataInvalid)
                      return
                }
                
                guard let modelT: T = try? JSONDecoder().decode(T.self, from: data) else {
                    onFailure(CustomError.failedDecoding)
                    return
                }
                
                onSuccess(modelT)
            }
        }
    }
}
