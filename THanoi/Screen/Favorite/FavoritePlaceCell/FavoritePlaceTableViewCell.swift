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
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var avgRatingLabel: UILabel!
    @IBOutlet weak var deleteView: UIView!
    
    var onTapContainerView: (() -> Void)?
    
    var onTapDeleteView: (() -> Void)?
    
    var originalPosition: CGPoint?
    
    var currentPannedCell: UITableViewCell?
    override func awakeFromNib() {
        super.awakeFromNib()
        
        avatarPlaceImageView.layer.cornerRadius = 5
        
        containerView.layer.cornerRadius = 10
        
        deleteView.layer.cornerRadius = 10
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))
        containerView.addGestureRecognizer(panGesture)
        
        let containerViewTap = UITapGestureRecognizer(target: self, action: #selector(containerViewTapped))
        containerView.addGestureRecognizer(containerViewTap)
        
        let deleteViewTap = UITapGestureRecognizer(target: self, action: #selector(deleteViewTapped))
        deleteView.addGestureRecognizer(deleteViewTap)
        
        // lawsng nghe thông báo để reset các cell khác
        NotificationCenter.default.addObserver(self, selector: #selector(resetPositionCell), name: Notification.Name("CloseOtherCells"), object: nil)
    }
    
    @objc func handlePan(_ gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: self) //khoảng cách mà người dùng vuốt
        
        // gesture.state có 3 trạng thái chính: .began → Bắt đầu vuốt, .changed → Đang vuốt, .ended → Kết thúc vuốt
        switch gesture.state {
        case .began:
            originalPosition = containerView.center
            // gửi thông báo để reset các cell khác
            NotificationCenter.default.post(name: Notification.Name("CloseOtherCells"), object: self)
        case .changed:
            // di chuyển view con theo tay
            if translation.x < 0 {
                containerView.transform = CGAffineTransform(translationX: translation.x, y: 0)
            }
        case .ended:
            // nếu kéo đủ sâu thfi giữ nguyên, còn kh thì về trạng thái ban đầu
            if translation.x < -50 {
                UIView.animate(withDuration: 0.1) {
                    self.containerView.transform = CGAffineTransform(translationX: -60, y: 0)
                }
            } else {
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
        
    }
    
    @objc func resetPositionCell() {
        UIView.animate(withDuration: 0.2) {
            self.containerView.transform = .identity
        }
    }
    
    @objc func containerViewTapped() {
        onTapContainerView?()
    }
    
    @objc func deleteViewTapped() {
        onTapDeleteView?()
    }
}
