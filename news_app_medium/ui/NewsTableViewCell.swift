//
//  NewsTableViewCell.swift
//  news_app_medium
//
//  Created by Qenawi on 8/21/20.
//  Copyright © 2020 Qenawi. All rights reserved.
//

import Foundation
import UIKit
class NewsTableViewCell: UITableViewCell {

      let titleLabel:UILabel = {
      let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 2
        lable.font = UIFont.systemFont(ofSize: 14)
        return lable
    }()
    
    
    let contentLabel: UILabel = {
        let lable  = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.numberOfLines = 8
        lable.textColor = .darkGray
        lable.font = UIFont.systemFont(ofSize: 12)
        return lable
    }()
     let thubnailImg:UIImageView = {
     let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([imageView.widthAnchor.constraint(equalToConstant: 80),])
        return imageView
    }()
    
    private let horizontalStackViewImgAndVerticalItems:UIStackView = {
      let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center
        return stackView
    }()
    private let verticallStackViewItems:UIStackView = {
         let stackView = UIStackView()
           stackView.translatesAutoresizingMaskIntoConstraints = false
           stackView.axis = .vertical
           stackView.spacing = 10
           stackView.alignment = .center
           return stackView
       }()
    private let rightVerticalStackView: UIStackView = {
       let stackView = UIStackView ()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 4
        return stackView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style , reuseIdentifier:reuseIdentifier)
        addSubview(horizontalStackViewImgAndVerticalItems)
        let padding : CGFloat = 10
        let paddingSup : CGFloat = 5

        NSLayoutConstraint.activate([
            horizontalStackViewImgAndVerticalItems.topAnchor.constraint(equalTo: topAnchor , constant: padding),
            horizontalStackViewImgAndVerticalItems.bottomAnchor.constraint(equalTo: bottomAnchor , constant: padding),
            horizontalStackViewImgAndVerticalItems.leftAnchor.constraint(equalTo: leftAnchor , constant: padding),
            horizontalStackViewImgAndVerticalItems.rightAnchor.constraint(equalTo: rightAnchor , constant: padding),
        ])
        
    

        
        
        // horizontal
        
        // vertical
        horizontalStackViewImgAndVerticalItems.addArrangedSubview(thubnailImg) // horizon
        verticallStackViewItems.addArrangedSubview(titleLabel)
        verticallStackViewItems.addArrangedSubview(contentLabel)
        verticallStackViewItems.addArrangedSubview(rightVerticalStackView)
        horizontalStackViewImgAndVerticalItems.addArrangedSubview(verticallStackViewItems)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
