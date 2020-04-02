//
//  CollectionViewCell.swift
//  CollectionViewInTableView
//
//  Created by MANOJ AHER on 4/2/20.
//  Copyright © 2020 MANOJ AHER. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    
    override func prepareForReuse() {
        userImage.image = nil
    }

}
