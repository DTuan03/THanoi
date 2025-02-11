//
//  FavoritePlaceTableViewCell.swift
//  THanoi
//
//  Created by Tuấn on 8/2/25.
//

import UIKit
import SwipeCellKit

class FavoritePlaceTableViewCell: UITableViewCell {
    
    @IBOutlet weak var avatarPlaceImageView: UIImageView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var deleteView: UIView!
    
    var originalPosition: CGPoint?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarPlaceImageView.layer.cornerRadius = 5
        
        containerView.layer.cornerRadius = 10
        
        deleteView.layer.cornerRadius = 10
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        containerView.addGestureRecognizer(panGesture)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self) //khoảng cách mà người dùng vuốt
        
        // gesture.state có 3 trạng thái chính: .began → Bắt đầu vuốt, .changed → Đang vuốt, .ended → Kết thúc vuốt
        switch gesture.state {
        case .began:
            originalPosition = containerView.center
            NotificationCenter.default.post(name: Notification.Name("CloseOtherCells"), object: self)
        case .changed:
            // Di chuyển view con theo tay
            if translation.x < 0 { // Chỉ cho phép vuốt sang trái
                containerView.transform = CGAffineTransform(translationX: translation.x, y: 0)
            }
        case .ended:
            if translation.x < -50 { // Nếu vuốt đủ xa, hiển thị nút Xóa
                UIView.animate(withDuration: 0.1) {
                    self.containerView.transform = CGAffineTransform(translationX: -60, y: 0)
                }
            } else { // Nếu vuốt không đủ xa, trả về vị trí ban đầu
                UIView.animate(withDuration: 0.2) {
                    self.containerView.transform = .identity
                }
            }
        default:
            break
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
