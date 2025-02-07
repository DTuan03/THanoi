//
//  FavoritePlaceTableViewCell.swift
//  THanoi
//
//  Created by Tuấn on 8/2/25.
//

import UIKit
import SwipeCellKit

class FavoritePlaceTableViewCell: SwipeTableViewCell {

    @IBOutlet weak var avatarPlaceImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarPlaceImageView.layer.cornerRadius = 5
        
        containerView.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
