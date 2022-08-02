//
//  ArticlePhoto.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class ArticlePhoto: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        roundCorners()
    }
    
    private func roundCorners() {
        self.layer.cornerRadius = 10.0
    }

}
