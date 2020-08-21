//
//  ViewController.swift
//  news_app_medium
//
//  Created by Qenawi on 8/21/20.
//  Copyright © 2020 Qenawi. All rights reserved.
//

import UIKit
import SafariServices
import RxSwift

class ViewController: UIViewController  {
    
    private let disposable=DisposeBag()
    private let client = NewsClient()
    private var articles : [Article] = []
    
    
    

    
    private let tableView: UITableView = {
        let m_tableView=UITableView()
        m_tableView.translatesAutoresizingMaskIntoConstraints=false
        m_tableView.tableFooterView=UIView()
        m_tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        m_tableView.rowHeight = UITableView.automaticDimension
        m_tableView.estimatedRowHeight = 134
        
        return m_tableView

    }()// table view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
             tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
             tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
        
        ])
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "Cell")
     
        client.headlines().subscribe(onSuccess: {[weak self] (response) in
            self?.articles = response.articles
            self?.tableView.reloadData()
            }// on success
            , onError: {(error) in print("recive error \(error)")
                
        }//on error
        ).disposed(by: disposable)
   
    }


}

extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell", for : indexPath) as! NewsTableViewCell
        let article = articles[indexPath.row]
        tableViewCell.titleLabel.text = article.title
        tableViewCell.contentLabel.text = article.content
        tableViewCell.thubnailImg.load(url: article.urlToImg ?? "")


        return tableViewCell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
}


extension ViewController : UITableViewDelegate {
  
    func tavleview(_tableView:UITableView , didSelectRowAt indexPath : IndexPath){
        let article = articles[indexPath.row]
        present(SFSafariViewController(url: article.url),animated: true ,completion: nil)
    }
}


