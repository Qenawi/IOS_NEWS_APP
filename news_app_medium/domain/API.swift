//
//  API.swift
//  news_app_medium
//
//  Created by Qenawi on 8/21/20.
//  Copyright © 2020 Qenawi. All rights reserved.
//

import Foundation

class Article :Decodable{
    let title:String
    let descreption:String?
    let url:URL
    let urlToImg:String?
    let content:String?
    
}

class ArticleResponse:Decodable{
    let totalResults:Int
    let articles:[Article]
}
