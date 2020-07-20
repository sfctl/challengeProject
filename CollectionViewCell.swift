//
//  CollectionViewCell.swift
//  challangeProject
//
//  Created by Yasemin YEL on 14.07.2020.
//  Copyright © 2020 Sifa. All rights reserved.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    static func nib() -> UINib {
        return UINib(nibName: "CollectionViewCell", bundle: nil)
    }
    
}
