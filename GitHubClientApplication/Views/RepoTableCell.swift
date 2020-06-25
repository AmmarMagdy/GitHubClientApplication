//
//  RepoTableCell.swift
//  GitHubClientApplication
//
//  Created by Ammar.M on 6/25/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import UIKit

class RepoTableCell: UITableViewCell {

    @IBOutlet private weak var repoNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func loadCellDate(title: String) {
        self.repoNameLabel.text = title
    }
    
}
