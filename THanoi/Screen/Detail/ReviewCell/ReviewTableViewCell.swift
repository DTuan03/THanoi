//
//  ReviewTableViewCell.swift
//  THanoi
//
//  Created by Tuấn on 6/2/25.
//

import UIKit
import Cosmos

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var avatarOfUserReview: UIImageView!
    @IBOutlet weak var nameOfUserReview: UILabel!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var contentLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarOfUserReview.layer.cornerRadius = avatarOfUserReview.frame.size.width / 2
        ratingView.settings.fillMode = .full
        ratingView.settings.totalStars = 5
        ratingView.settings.starSize = 20
        ratingView.settings.emptyBorderWidth = 2
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
