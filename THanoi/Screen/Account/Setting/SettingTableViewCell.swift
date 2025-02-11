//
//  SettingTableViewCell.swift
//  THanoi
//
//  Created by Tuấn on 9/2/25.
//

import UIKit

class SettingTableViewCell: UITableViewCell {

    @IBOutlet weak var detailArrowImageView: UIImageView!
    @IBOutlet weak var nameSettingLabel: UILabel!
    @IBOutlet weak var avatarSettingImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
