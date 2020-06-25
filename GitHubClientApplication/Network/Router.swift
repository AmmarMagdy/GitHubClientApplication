//
//  Router.swift
//  GitHubClientApplication
//
//  Created by Ammar.M on 6/25/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import KeychainSwift
import Alamofire

enum Router: URLRequestConvertible {
    
    case getAllRepositories
    
    var url: URL {
        switch self {
        case .getAllRepositories:
            return URL(string: "https://api.github.com/users/AmmarMagdy/repos")!
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getAllRepositories:
            return .get
        }
    }
    
    var header: [String: Any]? {
        switch self {
        case .getAllRepositories:
            return nil
        }
    }
    
    var parameter: Parameters? {
        switch self {
        case .getAllRepositories:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: url)
        urlRequest.method = method
        return urlRequest
    }
    
}
