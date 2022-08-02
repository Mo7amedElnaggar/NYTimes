//
//  MostPopularArticleCell.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class MostPopularArticleCell: UITableViewCell {

    @IBOutlet weak var photo: ArticlePhoto!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var publishedBy: UILabel!
    @IBOutlet weak var datePosted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.photo.image = nil
        self.title.text = ""
        self.publishedBy.text = ""
        self.datePosted.text = ""
    }
    
    func setArticleTitle(for title: String?) {
        self.title?.text = title
    }
    
    func setArticleDatePosted(for dateString: String?) {
        guard let publishedOn = dateString else { return }
        self.datePosted?.text = "Published On: \(publishedOn)"
    }
    
    func setArticlePublisher(for publisher: String?) {
        guard let publisherr = publisher else { return }
        self.publishedBy?.text = "Published by: \(publisherr)"
    }

    func setArticlePhoto(for imgUrl: String?) {
        guard let img = imgUrl , let url = URL(string: img) else { return }
        
        photo.downloadImage(from: url)
    }
}
