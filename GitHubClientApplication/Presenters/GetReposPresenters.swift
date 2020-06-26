//
//  GetReposPresenters.swift
//  GitHubClientApplication
//
//  Created by Ammar.M on 6/25/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Foundation

protocol GetRepoView: AnyObject {
    func showRepos(_ repos: [Repository])
}

protocol GetRepoPresenter {
    func fetchReposFromAPI()
}

class GetReposImpl: GetRepoPresenter {
    
    weak var view: GetRepoView?
    var repos: [Repository]!
    
    init(view: GetRepoView) {
        self.view = view
    }
    
    func fetchReposFromAPI() {
        Request.requestAPI(router: Router.getAllRepositories) { [unowned self](response) in
            switch response {
            case .success(let result):
                do {
                    self.repos = try JSONDecoder().decode([Repository].self, from: result)
                    self.view?.showRepos(self.repos)
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                Alert.shared.showAlert(title: "Error", message: error.localizedDescription)
            }
        }
    }
    
}


