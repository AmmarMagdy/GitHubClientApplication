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
    
    static func requestAPI(router: Router, _ completionHandler: @escaping (Result<Data, Error>) -> Void) {
        AF.request(Router.getAllRepositories).responseData { (response: AFDataResponse<Data>) in
            switch response.result {
            case .success(let data):
                completionHandler(.success(data))
            case.failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
