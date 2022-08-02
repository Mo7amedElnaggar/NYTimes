//
//  CustomError.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation

enum CustomError: Error {
    case dataInvalid
    case failedDecoding
    
    
    var localizedDescription: String {
        switch self {
        case .dataInvalid:
            return "Invalid Data Format"
        case .failedDecoding:
            return "Failed Decode JSON , Error JSON Format"
        }
    }
}
