//
//  DetailViewController.swift
//  THanoi
//
//  Created by Tuấn on 31/1/25.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var heightConstraintOfCollectionView: NSLayoutConstraint!
    @IBOutlet weak var heightConstraintOfBackView: NSLayoutConstraint!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    var topInset: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.delegate = self
        scrollView.bounces = false // tắt hiệu ứng khi kéo quá giới hạn
        
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        
        imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        imageCollectionView.bounces = false
        imageCollectionView.isPagingEnabled = true //Lat tung trang
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        topInset = Int(view.safeAreaInsets.top) // Khoảng cách từ màn hình đến Safe Area trên (status bar, notch)
        
//        heightConstraintOfCollectionView.constant = CGFloat(450 - 50 - topInset)
        heightConstraintOfBackView.constant = CGFloat(topInset + 50)
        
        
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        //chọn dựa vào chiều cao của view đấy, càng to thì chuyển càng chậm, càng nhỏ chuyển càng nhanh
        let maxOffset: CGFloat = imageCollectionView.frame.height - backView.frame.height// Mốc để chuyển hoàn toàn từ clear -> white
        
        // Tính toán alpha dựa trên vị trí cuộn
        let alpha = min(1, max(0, offsetY / maxOffset))
        backView.alpha = alpha
    }
}

extension DetailViewController: UICollectionViewDelegate {
    
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.image.image = UIImage(named: "Test")
//        cell.image.layer.cornerRadius = 20
        collectionView.layer.cornerRadius = 20
        
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.4)
    }
    //Khoang cach cac hang
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
