//
//  WeatherCollectionViewCell.swift
//  THanoi
//
//  Created by Tuấn on 15/2/25.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
    }

}
