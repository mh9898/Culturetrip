//
//  ViewController.swift
//  Culturetrip
//
//  Created by MiciH on 4/10/21.
//

import UIKit

class RootVC: UIViewController {
    
    let button = CTButton(backgroundColor: .systemGreen, title: "Articles")

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureVC()
        configureButton()
    }
    
    func configureVC(){
        view.backgroundColor = .systemBackground
        view.addSubview(button)
    }
    
    func configureButton(){
        
        button.addTarget(self, action: #selector(pushArticlesVC), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -40)
        ])
    }
    
    @objc func pushArticlesVC(){
        let articlesVC = ArticlesVC()
        navigationController?.pushViewController(articlesVC, animated: true)
    }
    
}

