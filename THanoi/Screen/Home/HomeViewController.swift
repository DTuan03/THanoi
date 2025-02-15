//
//  HomeViewController.swift
//  THanoi
//
//  Created by Tuấn on 21/1/25.
//

import UIKit
import Kingfisher

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
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var bestPlaceCollectionView: UICollectionView!
    // luu lai index cua item duoc chon
    var selectedItemIndex: IndexPath = IndexPath(row: 0, section: 0)
    var districtId: String = "TH1"
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeader()
        
        setupCollectionView(districtCollectionView, cellIdentifier: "NamePlaceCollectionViewCell")
        setupCollectionView(placeCollectionView, cellIdentifier: "PlaceCollectionViewCell")
        setupCollectionView(categoryCollectionView, cellIdentifier: "CategoryCollectionViewCell")
        setupCollectionView(bestPlaceCollectionView, cellIdentifier: "BestPlaceCollectionViewCell")

        configureFlowLayout(for: placeCollectionView)
        configureFlowLayout(for: categoryCollectionView)
        configureFlowLayout(for: districtCollectionView)

        searchTextField.addTarget(self, action: #selector(showSearchVC), for: .editingDidBegin)
        searchTextField.isUserInteractionEnabled = true
        filterButton.addTarget(self, action: #selector(showFilterVC), for: .touchUpInside)
        
        enableSwipeBack()
    }
    
    @objc func showSearchVC() {
        let searchVC = RecentSearchViewController()
        navigationController?.pushViewController(searchVC, animated: true)
    }
    
    @objc func showFilterVC() {
        let filterVC = FilterViewController()
        navigationController?.pushViewController(filterVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        notificationView.layer.cornerRadius = notificationView.frame.size.height / 2
    }
    
    func setUpHeader() {
        notificationView.layer.borderWidth = 1
        notificationView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
//        notificationView.layer.cornerRadius = notificationView.frame.size.height / 2
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
        searchTextField.endEditing(true)
        
        
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
                             sectionInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10)) {
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
            districtId = districts[indexPath.row].id ?? "null"
            districtCollectionView.reloadData()
            placeCollectionView.reloadData()
        } else if collectionView == placeCollectionView {
            let detailVC = DetailViewController()
            let placeDistrict = places.filter { place in
                return place.districtId == districtId
            }
            detailVC.placeId = placeDistrict[indexPath.row].id
            navigationController?.pushViewController(detailVC, animated: true)
//            detailVC.modalTransitionStyle = .crossDissolve
//            detailVC.modalPresentationStyle = .fullScreen
//            present(detailVC, animated: true)
        } else if collectionView == categoryCollectionView {
            
        } else if collectionView == bestPlaceCollectionView {
            let detailVC = DetailViewController()
            let placeAvgRating = places.sorted { $0.avgRating ?? 0.0 > $1.avgRating ?? 0.0 }
            detailVC.placeId = placeAvgRating[indexPath.row].id
            print(placeAvgRating[indexPath.row].createdAt)
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var numberOfItems: Int = 0
        if collectionView == districtCollectionView {
            numberOfItems = districts.count
        } else if collectionView == placeCollectionView {
            let placesIn = places.filter { place in
                place.districtId == districtId
            }
            numberOfItems = placesIn.count
        } else if collectionView == categoryCollectionView {
            numberOfItems = category.count
        } else if collectionView == bestPlaceCollectionView {
            numberOfItems = 4
        }
        return numberOfItems
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        if collectionView == districtCollectionView {
            let districtCell = collectionView.dequeueReusableCell(withReuseIdentifier: "NamePlaceCollectionViewCell", for: indexPath) as! NamePlaceCollectionViewCell
            
            districtCell.nameDistrictLabel.text = districts[indexPath.row].name
            
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
                return place.districtId == districtId
            }
            
            let placeImages = placeDistrict.map { place in
                return place.avatar
            }
            let url = URL(string: placeImages[indexPath.row] ?? "")
            placeCell.placeImage.kf.setImage(with: url)
            
            let placeNames = placeDistrict.map { place in
                return place.name
            }
            placeCell.nameLabel.text = placeNames[indexPath.row]
            
            let placeAddress = placeDistrict.map { place in
                return place.address
            }
            placeCell.addressLabel.text = placeAddress[indexPath.row]
            
            let placeAvgRating = placeDistrict.map { place in
                return place.avgRating
            }
            placeCell.averageRatingLabel.text = String(placeAvgRating[indexPath.row] ?? 0.0)
            
            cell = placeCell

        } else if collectionView == categoryCollectionView {
            let tagCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            let image = category[indexPath.row].image
            tagCell.avatarImageView.image = UIImage(named: image)
            tagCell.nameTagLabel.text = category[indexPath.row].name
            
            cell = tagCell
        } else if collectionView == bestPlaceCollectionView {
            let bestCell = collectionView.dequeueReusableCell(withReuseIdentifier: "BestPlaceCollectionViewCell", for: indexPath) as! BestPlaceCollectionViewCell
            bestCell.avatarImageView.image = UIImage(named: "Test")
            
            let placeAvgRating = places.sorted { $0.avgRating ?? 0.0 > $1.avgRating ?? 0.0 }
            bestCell.avatarImageView.kf.setImage(with: URL(string: placeAvgRating[indexPath.row].avatar ?? ""))
            bestCell.namePlaceLabel.text = placeAvgRating[indexPath.row].name
            bestCell.avgRatingLabel.text = String(placeAvgRating[indexPath.row].avgRating ?? 0.0)
            cell = bestCell
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var sizeForItem: CGSize = CGSize(width: 0, height: 0)
        if collectionView == districtCollectionView {
            let namePlace = districts[indexPath.row].name

            let label = UILabel()
            label.text = namePlace
            label.font = UIFont.systemFont(ofSize: 16)
            
            let maxWidth: CGFloat = collectionView.frame.width
            let labelSize = label.sizeThatFits(CGSize(width: maxWidth, height: .greatestFiniteMagnitude))
            
            sizeForItem = CGSize(width: labelSize.width + 22, height: 30)
        } else if collectionView == placeCollectionView {
            let height = collectionView.frame.size.height * 0.95
            let width = height * 0.8
            sizeForItem = CGSize(width: width, height: height)
        } else if collectionView == categoryCollectionView {
            let height = collectionView.frame.size.height * 0.9
            let width = height * 0.7
            sizeForItem = CGSize(width: width, height: height)
        } else if collectionView == bestPlaceCollectionView {
            let padding: CGFloat = 10
            let availableWidth = collectionView.frame.width - padding
            let width = availableWidth / 2
            let height = width
            
            sizeForItem = CGSize(width: width, height: height)
        }
        return sizeForItem
    }
}

