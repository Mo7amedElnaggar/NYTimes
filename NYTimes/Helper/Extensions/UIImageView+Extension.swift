//
//  UIImageView+Extension.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    
    func downloadImage(using imgString: String , onSuccess: @escaping () -> Void? , onFailure: @escaping (Error) -> Void?) {
        guard let url = URL(string: imgString) else { return }
        
        downloadImage(from: url, onSuccess: onSuccess, onFailure: onFailure)
    }
    
    func downloadImage(from url: URL , onSuccess: @escaping () -> Void? , onFailure: @escaping (Error) -> Void?) {
        
        Network.shared.dataTask(url: url) { (result) in
            switch(result) {
            case .failure(let err):
                onFailure(err)
            case .success(let (data, _)):
                guard let data = data else { return }
                let img = UIImage(data: data)
                
                DispatchQueue.main.async { [weak self] in
                    self?.image = img
                    onSuccess()
                }
            }
        }
    }
}
