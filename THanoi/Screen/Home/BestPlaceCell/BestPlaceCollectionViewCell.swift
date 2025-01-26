//
//  BestPlaceCollectionViewCell.swift
//  THanoi
//
//  Created by Tuấn on 25/1/25.
//

import UIKit

class BestPlaceCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var informationPlaceView: UIView!
    @IBOutlet weak var namePlaceLabel: UILabel!
    @IBOutlet weak var avgRatingLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
//        let path = UIBezierPath(
//            roundedRect: informationPlaceView.bounds,
//            byRoundingCorners: [.topLeft, .topRight], // Bo góc trên
//            cornerRadii: CGSize(width: 10, height: 10) // Độ bo tròn
//        )
//        
//        let mask = CAShapeLayer()
//        mask.path = path.cgPath
//        informationPlaceView.layer.mask = mask
    }
    
}
