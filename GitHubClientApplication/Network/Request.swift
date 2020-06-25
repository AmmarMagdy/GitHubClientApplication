//
//  Request.swift
//  GitHubClientApplication
//
//  Created by Ammar.M on 6/25/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Alamofire
import KeychainSwift

class Request {
    static func requestAPI(_ completionHandler: @escaping (Result<[Repository], Error>) -> Void) {
        
        AF.request(Router.getAllRepositories).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                do {
                    let repos =  try JSONDecoder().decode([Repository].self, from: data)
                    completionHandler(.success(repos))
                } catch let error {
                    completionHandler(.failure(error))
                }
            case.failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
