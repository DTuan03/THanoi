//
//  TagCollectionViewCell.swift
//  THanoi
//
//  Created by Tuấn on 24/1/25.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameTagLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.layer.cornerRadius = 10
    }

}
