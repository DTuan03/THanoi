//
//  PlannedPlaceTableViewCell.swift
//  THanoi
//
//  Created by Tuấn on 7/2/25.
//

import UIKit
import SwipeCellKit

class PlannedPlaceTableViewCell: SwipeTableViewCell {

    @IBOutlet weak var avatarPlaceImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarPlaceImageView.layer.cornerRadius = 10
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
