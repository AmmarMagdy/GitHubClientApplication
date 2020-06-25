//
//  UIImageView+Extensions.swift
//  GitHubClientApplication
//
//  Created by Ammar.M on 6/25/20.
//  Copyright © 2020 Ammar.M. All rights reserved.
//

import Kingfisher

extension UIImageView {
    
func showImage(_ url:String) {
    let main = URL(string: url)
    self.kf.indicator?.startAnimatingView()
    self.kf.indicatorType = .activity
    self.kf.setImage(with: main)  {[weak self] result in
        self?.kf.indicator?.stopAnimatingView()
        switch result {
        case .success:
            self?.contentMode = .scaleToFill
            break
        case .failure:
            self?.contentMode = .scaleAspectFit
            self?.image = #imageLiteral(resourceName: "31")
        }
    }
}
}
