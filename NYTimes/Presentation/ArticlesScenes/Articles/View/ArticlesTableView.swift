//
//  ArticlesTableView.swift
//  NYTimes
//
//  Created by Mohamed El-Naggar on 8/24/20.
//  Copyright © 2020 Mohamed El-Naggar. All rights reserved.
//

import UIKit

class ArticlesTableView: UITableViewController {

    var articlesViewModel: ArticlesViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        articlesViewModel = ArticlesViewModel()
        articlesViewModel?.delegate = self
        articlesViewModel?.fetchData()
        
        self.clearsSelectionOnViewWillAppear = false
    }
    
    
    // Transitioning Between ViewControllers
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.segueIdFordetailedArt {
            if let indexPath = tableView.indexPathForSelectedRow {
                let article = articlesViewModel?.articles?[indexPath.row]
                
                if let destVC = segue.destination as? ArticleDetailedVC {
                    destVC.article = article
                    destVC.navigationItem.leftItemsSupplementBackButton = true
                }
            }
        }
    }
    
}

// MARK: - TableView DataSource , Delegates
extension ArticlesTableView {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let articles = articlesViewModel?.articles else { return 0 }
        return articles.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MostPopularArticleCell.className) as? MostPopularArticleCell else {
            return UITableViewCell()
        }

        let article = articlesViewModel?.articles?[indexPath.row]
        
        cell.setArticleTitle(for: article?.title)
        cell.setArticlePublisher(for: article?.byline)
        cell.setArticleDatePosted(for: article?.publishedDate)
        cell.setArticlePhoto(for: article?.media.first?.mediaMetadata.first?.url)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constants.segueIdFordetailedArt, sender: nil)
    }
}


extension ArticlesTableView: ArticlesViewModelDelegate {
    
    func didRecieveArticles() {
        self.tableView.reloadData()
    }
    
    func didRecieveError(errMsg: String) {
        assertionFailure(errMsg)
    }
    
    
}
