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
    static func requestAPI(_ completionHandler: @escaping (Result<Data, Error>, Int?) -> Void) {
        
        AF.request(Router.getAllRepositories).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data), response.response?.statusCode)
                if response.response?.statusCode == 422 {
                    KeychainSwift().delete("auth_token")
                }
            case.failure(let error):
                completionHandler(.failure(error), response.response?.statusCode)
            }
        }
    }
}
