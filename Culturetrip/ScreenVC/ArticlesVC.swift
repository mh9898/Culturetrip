//
//  ArticlesVC.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit

class ArticlesVC: UIViewController {
    
    let navTitle = "Articles"
    var tableView = UITableView()
    var articles:[Article] = []
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureTableView()
        requestArticles()
    }
    
    func configureVC(){
        title = navTitle
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        
        tableView.frame = view.bounds
        tableView.rowHeight = 400
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(ArticleCell.self, forCellReuseIdentifier: ArticleCell.reuseID)
    }
    
    func requestArticles(){
        NetworkManager.shard.getArticles { [weak self] result in
            
            guard let self = self else { return }
            
            switch result{
            case .success(let articlesData):
                self.articles = articlesData.data
                if self.articles.isEmpty {
                    print("there is no articles")
                }
                else{
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.view.bringSubviewToFront(self.tableView)
                    }
                }
                
            case .failure(let error):
                self.presentCTAlertOnMainThread(title: "Something wrong", message: error.rawValue, buttonTitle: "Ok")
            }
           
        }
    }
    
}

extension ArticlesVC: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(articles.count)
        print(articles)
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleCell.reuseID) as! ArticleCell
        let article = articles[indexPath.row]
        cell.set(article: article)
        return cell
    }
    
    
}
