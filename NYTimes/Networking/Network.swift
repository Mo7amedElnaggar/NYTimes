//
//  Network.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

class Network {
    static let shared = Network()
    private let session: URLSession = URLSession.shared

    private init() {}
    
    func dataTask(url: URL, completion: @escaping (Result<(Data?, HTTPURLResponse), Error>) -> Void) {
        session.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    return completion(.failure(error))
                }
                
                guard let response = response as? HTTPURLResponse else {
                    return completion(.failure(CustomError.dataInvalid))
                }
                
                switch response.statusCode {
                case 200..<300:
                    completion(.success((data, response)))
                default:
                    completion(.failure(CustomError.dataInvalid))
                }
            }
        }.resume()
    }
}

