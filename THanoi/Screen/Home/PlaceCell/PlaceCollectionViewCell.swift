//
//  PlaceCollectionViewCell.swift
//  THanoi
//
//  Created by Tuấn on 23/1/25.
//

import UIKit

class PlaceCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var averageRatingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderWidth = 0.2
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.shadowRadius = 1                   // Bán kính của bóng (độ mềm mại của bóng)
        self.layer.cornerRadius = 10
//        containerView.layer.cornerRadius = 10
//        containerView.layer.borderWidth = 1
//        containerView.layer.borderColor = UIColor.gray.cgColor
        placeImage.layer.cornerRadius = 5
    }

}
