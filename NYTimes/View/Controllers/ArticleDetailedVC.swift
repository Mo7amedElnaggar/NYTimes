//
//  ArticleDetailedVC.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class ArticleDetailedVC: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var articlePhoto: UIImageView!
    @IBOutlet weak var articleTitleLbl: UILabel!
    @IBOutlet weak var articleAbstractLbl: UILabel!
    @IBOutlet weak var publishingDateLbl: UILabel!
    @IBOutlet weak var publisherLbl: UILabel!
    @IBOutlet weak var copyRightReservedLbl: UILabel!
    
    
    // MARK: Variables
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let articleAdded = article {
            bindArticle(for: articleAdded)
        }

    }
    
    // MARK: Setup Article data
    private func bindArticle(for article: Article) {
        if let imgUrl = article.media.first?.mediaMetadata.first?.url {
            self.articlePhoto.downloadImage(using: imgUrl, onSuccess: { () -> Void? in
                print("DONE Downloading image")
            }) { (err: Error) -> Void? in
                assertionFailure(err.localizedDescription)
            }
        }
        
        self.articleTitleLbl?.text = article.title
        self.title = article.title
        self.articleAbstractLbl?.text = article.abstract
        self.publishingDateLbl?.text = "Published on: \(article.publishedDate)"
        self.publisherLbl?.text = article.byline
        
        if let reservedRight = article.media.first?.copyright {
            self.copyRightReservedLbl?.text = "All Copyright reserved @ \(reservedRight)"
        }

    }

}
