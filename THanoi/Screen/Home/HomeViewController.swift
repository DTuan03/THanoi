//
//  HomeViewController.swift
//  THanoi
//
//  Created by Tuấn on 21/1/25.
//

import UIKit

enum CollectionViewType {
    case districtCollectionView
    case placeCollectionView
    case tagCollectionView
    case bestPlaceCollectionView
}

class HomeViewController: UIViewController {
    @IBOutlet weak var notificationView: UIView!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var districtCollectionView: UICollectionView!
    @IBOutlet weak var placeCollectionView: UICollectionView!
    @IBOutlet weak var tagCollectionView: UICollectionView!
    @IBOutlet weak var bestPlaceCollectionView: UICollectionView!
    @IBOutlet weak var heightPlaceCollectionAnhNamePlaceCollection: NSLayoutConstraint!
    var selectedItemIndex: IndexPath = IndexPath(row: 0, section: 0) //luu lai index cua item duoc chon
    var districtName: String = "Ba Đình"
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeader()
        
        setupCollectionView(districtCollectionView, cellIdentifier: "NamePlaceCollectionViewCell")
        setupCollectionView(placeCollectionView, cellIdentifier: "PlaceCollectionViewCell")
        setupCollectionView(tagCollectionView, cellIdentifier: "TagCollectionViewCell")
        setupCollectionView(bestPlaceCollectionView, cellIdentifier: "BestPlaceCollectionViewCell")

        configureFlowLayout(for: placeCollectionView)
        configureFlowLayout(for: tagCollectionView)
        configureFlowLayout(for: districtCollectionView)
    }
    
    func setUpHeader() {
        notificationView.layer.borderWidth = 1
        notificationView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        notificationView.layer.cornerRadius = notificationView.frame.size.height / 2
        notificationImageView.image = UIImage(systemName: "bell")
        notificationImageView.tintColor = .gray
        
        titleLabel.text = NSLocalizedString("titleHome", comment: "")
        let atributedText = NSAttributedString().highLightText(fullText: NSLocalizedString("titleHome", comment: ""), highLighText: NSLocalizedString("hightLineTitleHome", comment: ""), highLightColor: UIColor.color)
        titleLabel.attributedText = atributedText
        
        searchTextField.imageLeftView(image: "magnifyingglass", placeholder: "search")
        searchTextField.backgroundColor = .white
        searchTextField.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        searchTextField.layer.borderWidth = 1.0
        searchTextField.layer.cornerRadius = 15
        searchTextField.layer.masksToBounds = true
        
        
        filterButton.setTitle("", for: .normal)
        filterButton.setImage(UIImage(systemName: "slider.horizontal.3"), for: .normal)
        filterButton.setTitleColor(.black, for: .normal)
        filterButton.layer.borderWidth = 1
        filterButton.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        filterButton.layer.cornerRadius = 15
        filterButton.clipsToBounds = true
    }
    
    func setupCollectionView(_ collectionView: UICollectionView, cellIdentifier: String) {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: cellIdentifier, bundle: nil), forCellWithReuseIdentifier: cellIdentifier)
        collectionView.showsHorizontalScrollIndicator = false
    }
        
    func configureFlowLayout(for collectionView: UICollectionView,
                             estimatedItemSize: CGSize = .zero,
                             minimumLineSpacing: CGFloat = 20,
                             sectionInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)) {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.estimatedItemSize = estimatedItemSize
            layout.minimumLineSpacing = minimumLineSpacing
            layout.sectionInset = sectionInset
        }
    }

    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == districtCollectionView {
            selectedItemIndex = indexPath
            districtName = districtsInHanoi[indexPath.row]
            districtCollectionView.reloadData()
            placeCollectionView.reloadData()
        } else if collectionView == placeCollectionView {
            let detailVC = DetailViewController()
            detailVC.modalTransitionStyle = .crossDissolve
            detailVC.modalPresentationStyle = .fullScreen
            present(detailVC, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems: Int = 0
        if collectionView == districtCollectionView {
            numberOfItems = districtsInHanoi.count
        } else if collectionView == placeCollectionView {
            let placesIn = places.filter { place in
                place.district == districtName
            }
            numberOfItems = placesIn.count
        } else if collectionView == tagCollectionView {
            numberOfItems = nameTags.count
        } else if collectionView == bestPlaceCollectionView {
            numberOfItems = 4
        }
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        if collectionView == districtCollectionView {
            let districtCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NamePlaceCollectionViewCell", for: indexPath) as! NamePlaceCollectionViewCell
            
            districtCell.nameDistrictLabel.text = districtsInHanoi[indexPath.row]
            
            if indexPath.row == selectedItemIndex.row {
                districtCell.nameDistrictLabel.textColor = UIColor.color
                districtCell.nameDistrictLabel.font = UIFont.boldSystemFont(ofSize: 16)
            } else {
                districtCell.nameDistrictLabel.textColor = UIColor.black
                districtCell.nameDistrictLabel.font = UIFont.systemFont(ofSize: 16)
            }
            cell = districtCell
            
        } else if collectionView == placeCollectionView {
            let placeCell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceCollectionViewCell", for: indexPath) as! PlaceCollectionViewCell
            
            let placeDistrict = places.filter { place in
                return place.district == districtName
                
            }
            
            placeCell.placeImage.image = UIImage(named: "Test")
            
            let placeNames = placeDistrict.map { place in
                return place.name
            }
            placeCell.nameLabel.text = placeNames[indexPath.row]
            let placeAddress = placeDistrict.map { place in
                return place.address
            }
            placeCell.addressLabel.text = placeAddress[indexPath.row]
            
            let placeAvgRating = placeDistrict.map { place in
                return place.averageRating
            }
            placeCell.averageRatingLabel.text = String(placeAvgRating[indexPath.row])
            
            cell = placeCell

        } else if collectionView == tagCollectionView {
            let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionViewCell", for: indexPath) as! TagCollectionViewCell
            tagCell.avatarImageView.image = UIImage(named: "Test")
            tagCell.nameTagLabel.text = nameTags[indexPath.row]
            
            cell = tagCell
        } else if collectionView == bestPlaceCollectionView {
            let bestCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestPlaceCollectionViewCell", for: indexPath) as! BestPlaceCollectionViewCell
            bestCell.avatarImageView.image = UIImage(named: "Test")
            
            let placeAvgRating = places.sorted { $0.averageRating > $1.averageRating }
            bestCell.namePlaceLabel.text = placeAvgRating[indexPath.row].name
            bestCell.avgRatingLabel.text = String(placeAvgRating[indexPath.row].averageRating)
            cell = bestCell
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var sizeForItem: CGSize = CGSize(width: 0, height: 0)
        if collectionView == districtCollectionView {
            let namePlace = districtsInHanoi[indexPath.row]

            let label = UILabel()
            label.text = namePlace
            label.font = UIFont.systemFont(ofSize: 16)
            
            // Tính toán chiều rộng của label dựa trên nội dung của nó
            let maxWidth: CGFloat = collectionView.frame.width // Giới hạn chiều rộng (tùy chỉnh khoảng cách margin)
            let labelSize = label.sizeThatFits(CGSize(width: maxWidth, height: .greatestFiniteMagnitude))
            
            // Trả về kích thước cell với chiều rộng bằng chiều rộng của label và chiều cao cố định
            sizeForItem = CGSize(width: labelSize.width + 22, height: 30) // Chiều rộng = width của label + margin, chiều cao tùy chỉnh
        } else if collectionView == placeCollectionView {
            let height = collectionView.frame.size.height * 0.95
            let width = height * 0.8
            sizeForItem = CGSize(width: width, height: height)
        } else if collectionView == tagCollectionView {
            let height = collectionView.frame.size.height * 0.9
            let width = height * 0.7
            sizeForItem = CGSize(width: width, height: height)
        } else if collectionView == bestPlaceCollectionView {
            // Tính toán kích thước cell để có 2 cột
            let padding: CGFloat = 10 // Khoảng cách giua cac item
            let availableWidth = collectionView.frame.width - padding
            let width = availableWidth / 2 // Hai cột
            let height = width// Hai dòng
            
            sizeForItem = CGSize(width: width, height: height)
        }
        return sizeForItem
    }
}

