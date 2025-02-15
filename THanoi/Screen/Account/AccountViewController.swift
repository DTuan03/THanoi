//
//  AccountViewController.swift
//  THanoi
//
//  Created by Tuấn on 8/2/25.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var avatarUser: UIImageView!
    @IBOutlet weak var settingTableView: UITableView!
    @IBOutlet weak var heightOfSettingTableViewConstraint: NSLayoutConstraint!
    let dataSetting: [SettingAccountModel] = [
        SettingAccountModel(avatar: "person", nameSetting: "Hồ sơ"),
        SettingAccountModel(avatar: "lock.shield", nameSetting: "Bảo mật"),
        SettingAccountModel(avatar: "bell", nameSetting: "Thông báo"),
        SettingAccountModel(avatar: "globe.central.south.asia", nameSetting: "Ngôn ngữ"),
        SettingAccountModel(avatar: "iphone.and.arrow.forward.outward", nameSetting: "Đăng xuất")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        avatarUser.layer.cornerRadius = avatarUser.frame.size.height / 2

        settingTableView.layer.borderWidth = 0.5
        settingTableView.layer.borderColor = UIColor.lightGray.cgColor
        settingTableView.layer.cornerRadius = 10
        
        settingTableView.isScrollEnabled = false
        
        settingTableView.delegate=self
        settingTableView.dataSource = self
        
        settingTableView.register(UINib(nibName: "SettingTableViewCell", bundle: nil), forCellReuseIdentifier: "SettingTableViewCell")
        
        enableSwipeBack()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        avatarUser.layer.cornerRadius = avatarUser.frame.size.height / 2
        
        settingTableView.layoutIfNeeded() // tinh toan kich thuoc cell truoc
        
        // Lấy chiều cao cell đầu tiên
        if let firstCell = settingTableView.cellForRow(at: IndexPath(row: 0, section: 0)) {
            let cellHeight = firstCell.frame.height
            heightOfSettingTableViewConstraint.constant = cellHeight * 5
        }
    }
}

extension AccountViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let witdhCell = tableView.frame.size.width
        let height = witdhCell * 0.07 + 40
        
        return height
    }
}

extension AccountViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell
        cell.selectionStyle = .none
        cell.layer.borderWidth = 0.2
        cell.layer.borderColor = UIColor.lightGray.cgColor
        
        cell.avatarSettingImageView.image = UIImage(systemName: dataSetting[indexPath.row].avatar)
        cell.nameSettingLabel.text = dataSetting[indexPath.row].nameSetting
        if indexPath.row == 4 {
            cell.detailArrowImageView.isHidden = true
        }
        
        return cell
    }
}
