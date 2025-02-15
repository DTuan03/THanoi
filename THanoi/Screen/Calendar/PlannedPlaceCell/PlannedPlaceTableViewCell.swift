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
    @IBOutlet weak var namePlaceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var isVisitedImageView: UIImageView!
    var onCheckmarkTapped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarPlaceImageView.layer.cornerRadius = 10
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(checkmarkTapped))
        isVisitedImageView.addGestureRecognizer(tapGesture)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @objc func checkmarkTapped() {
           onCheckmarkTapped?()
       }
    
}
