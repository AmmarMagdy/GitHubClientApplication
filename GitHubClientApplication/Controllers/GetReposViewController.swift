//
//  GetReposViewController.swift
//  GitHubClientApplication
//
//  Created by Ammar.M on 6/25/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import NVActivityIndicatorView

class GetReposViewController: UIViewController, NVActivityIndicatorViewable {
    
    @IBOutlet weak var reposTableView: UITableView!
    
    var getRepoPresenter: GetRepoPresenter?
    private var repos: [Repository]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCustomCells()
        getRepoPresenter = GetReposImpl(view: self)
        self.startAnimating()
        getRepoPresenter?.fetchReposFromAPI()
    }
    
}

// MARK: - UITableViewDataSource

extension GetReposViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return repos != nil ? repos.count : 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepoCell") as! RepoTableCell
        return cell
    }
}

// MARK: - UITableViewDelegate Functions

extension GetReposViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.view.bounds.height * 0.13
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 5
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 5))
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let cell = cell as! RepoTableCell
        cell.loadCellDate(
            repoName: repos[indexPath.section].owner?.login ?? "",
            ownerImage: repos[indexPath.section].owner?.avatarUrl ?? "",
            projaectName: "Project Name is \(repos[indexPath.section].name ?? "")")
    }
}

// MARK: - Private Functions

extension GetReposViewController {
    
    private func registerCustomCells() {
        let repoCellNib = UINib(nibName: "RepoTableCell", bundle: nil)
        reposTableView.register(repoCellNib, forCellReuseIdentifier: "RepoCell")
    }
}

extension GetReposViewController: GetRepoView {
    func showRepos(_ repos: [Repository]) {
        self.stopAnimating()
        self.repos = repos
        self.reposTableView.reloadData()
    }
}
