//
//  FilterViewController.swift
//  THanoi
//
//  Created by Tuấn on 12/2/25.
//

import UIKit
import DropDown

class FilterViewController: UIViewController {
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var heightCategoryCollectionView: NSLayoutConstraint!
    @IBOutlet weak var districtTextField: UITextField!
    @IBOutlet weak var ratingTextField: UITextField!
    @IBOutlet weak var applyButton: UIButton!
    
    @IBOutlet weak var backImageView: UIImageView!
    var districtDropDown = DropDown()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
            
        categoryCollectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        
        if let layout = categoryCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize  = .zero
            layout.minimumLineSpacing = 10
            layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        let categoryLabel = UILabel()
        categoryLabel.text = category[0].name
        
        let maxWidth = categoryCollectionView.frame.width
        let categoryLabelSize = categoryLabel.sizeThatFits(CGSize(width: maxWidth, height: .greatestFiniteMagnitude))

//        heightCategoryCollectionView.constant = UIScreen.main.bounds.width * 0.25
//        categoryLabelSize.height * 3 + 60 + 20
        
        if UIScreen.main.bounds.width > 420 {
            heightCategoryCollectionView.constant = categoryLabelSize.height * 2 + 40 + 10
        } else {
            heightCategoryCollectionView.constant = categoryLabelSize.height * 2 + 40 + 10
        }
        
        districtTextField.placeholder = "Chọn địa điểm"
        districtTextField.imageLeftView(image: "magnifyingglass", placeholder: "Chọn địa điểm")
//        districtTextField.inputView = UIView()
        districtTextField.addTarget(self, action: #selector(showDistrictDropDown), for: .editingDidBegin)
        districtDropDown.anchorView = districtTextField
        districtDropDown.dataSource = [
            "Ba Đình",
            "Ba Vì",
            "Bắc Từ Liêm",
            "Cầu Giấy",
            "Chương Mỹ",
            "Đan Phượng",
            "Đống Đa",
            "Đông Anh",
            "Gia Lâm",
            "Hà Đông",
            "Hai Bà Trưng",
            "Hoài Đức",
            "Hoàn Kiếm",
            "Hoàng Mai",
            "Long Biên",
            "Mê Linh",
            "Mỹ Đức",
            "Nam Từ Liêm",
            "Phú Xuyên",
            "Phúc Thọ",
            "Quốc Oai",
            "Sơn Tây",
            "Sóc Sơn",
            "Tây Hồ",
            "Thạch Thất",
            "Thanh Oai",
            "Thanh Trì",
            "Thanh Xuân",
            "Thường Tín",
            "Ứng Hòa"
        ]
        districtDropDown.bottomOffset = CGPoint(x: 0, y: districtTextField.bounds.height)
        
        districtDropDown.selectionAction = { [weak self] (index: Int, item: String) in
            self?.districtTextField.text = item
            //bo focus
            self?.districtTextField.endEditing(true)

        }
        
        ratingTextField.placeholder = "Xếp hạng"
        
        let backImageViewTap = UITapGestureRecognizer(target: self, action: #selector(backScreen))
        backImageView.addGestureRecognizer(backImageViewTap)
        
        addDismissKeyboard()
    }
    
    @objc func backScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func showDistrictDropDown() {
        districtDropDown.show()
//        view.endEditing(true)
    }
}

extension FilterViewController: UICollectionViewDelegate {
    
}

extension FilterViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return category.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath)
        
//        for subview in cell.contentView.subviews {
//                    subview.removeFromSuperview()
//                }
        
        let categoryLabel = UILabel(frame: cell.bounds)
        categoryLabel.text = category[indexPath.row].name
        categoryLabel.textAlignment = .center
        categoryLabel.textColor = .black
        
        let maxWidth = collectionView.frame.width
        let categoryLabelSize = categoryLabel.sizeThatFits(CGSize(width: maxWidth, height: .greatestFiniteMagnitude))
        
        let containerView = UIView(frame: cell.bounds)
        containerView.frame.size = CGSize(width: categoryLabelSize.width + 20, height: categoryLabelSize.height + 20)
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.clipsToBounds = true
        containerView.layer.cornerRadius = (containerView.frame.size.height) / 2
        containerView.addSubview(categoryLabel)
        
        categoryLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        categoryLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
        
        cell.contentView.addSubview(containerView)
        
        return cell
    }
}

extension FilterViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let categoryLabel = UILabel()
        categoryLabel.text = category[indexPath.row].name
        
        let maxWidth = collectionView.frame.width
        
        let categoryLabelSize = categoryLabel.sizeThatFits(CGSize(width: maxWidth, height: .greatestFiniteMagnitude))
        
//        print(categoryLabelSize)
        return CGSize(width: categoryLabelSize.width + 20, height: categoryLabelSize.height + 20)
    }
}
