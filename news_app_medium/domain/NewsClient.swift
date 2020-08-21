//
//  NewsClient.swift
//  news_app_medium
//
//  Created by Qenawi on 8/21/20.
//  Copyright © 2020 Qenawi. All rights reserved.
//

import Foundation
import RxSwift
import Alamofire
private let apiKey:String = "1c7ed3accc364660b269a9c82c7b39f1"
private let path = "http://newsapi.org/v2/top-headlines?apiKey=\(apiKey)&country=us"
enum ClientResponse:Error{
  case missingResponseData
}

class NewsClient{
    
    func headlines() -> Single<ArticleResponse> {
        return Single.create{(emitter)-> Disposable in
            let session = Alamofire.Session()
            session.request(path).responseJSON {(response) in
                    if let error = response.error{
                       emitter(.error(error))
                    return
                }//error
                guard let data = response.data else {
                    emitter(.error(ClientResponse.missingResponseData))
                    return
                }//guard
                do{
                    let articiles = try JSONDecoder().decode(ArticleResponse.self, from: data)
                    emitter(.success(articiles))
                    
                }//do
                catch{
                    emitter(.error(error))
                }
            }//response json
            return Disposables.create{
                session.cancelAllRequests()
            }
            
            
        }//create
    }
    
}
