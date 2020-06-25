//
//  RepoTableCell.swift
//  GitHubClientApplication
//
//  Created by Ammar.M on 6/25/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit
import Kingfisher

class RepoTableCell: UITableViewCell {

    @IBOutlet private weak var repoNameLabel: UILabel!
    @IBOutlet weak var repoOwnerImageView: UIImageView!
    @IBOutlet weak var projectNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadCellDate(repoName: String, ownerImage: String, projaectName: String) {
        self.repoNameLabel.text = repoName
        self.repoOwnerImageView.showImage(ownerImage)
        self.projectNameLabel.text = projaectName
    }
    
}
