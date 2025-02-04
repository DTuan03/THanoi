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
    var selectedItemIndex: IndexPath = IndexPath(row: 0, section: 0)//luu lai index cua item duoc chon
    var districtName: String = "Ba Đình"
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpHeader()
        
        districtCollectionView.delegate = self
        districtCollectionView.dataSource = self
        
        districtCollectionView.register(UINib(nibName: "NamePlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NamePlaceCollectionViewCell")
        districtCollectionView.showsHorizontalScrollIndicator = false
        
        placeCollectionView.delegate = self
        placeCollectionView.dataSource = self
        
        placeCollectionView.register(UINib(nibName: "PlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlaceCollectionViewCell")
        placeCollectionView.showsHorizontalScrollIndicator = false
        
        tagCollectionView.delegate = self
        tagCollectionView.dataSource = self
        
        tagCollectionView.register(UINib(nibName: "TagCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TagCollectionViewCell")
        tagCollectionView.showsHorizontalScrollIndicator = false
        
        bestPlaceCollectionView.delegate = self
        bestPlaceCollectionView.dataSource = self
        
//        bestPlaceCollectionView.frame.size.width = view.frame.width - 20 * 2
        bestPlaceCollectionView.frame.size.height = view.frame.width - 20 * 2
        
        bestPlaceCollectionView.register(UINib(nibName: "BestPlaceCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "BestPlaceCollectionViewCell")
        
    }
    
    func setUpHeader() {
        notificationView.layer.borderWidth = 1
        notificationView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        notificationView.layer.cornerRadius = 25
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
    
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == districtCollectionView {
            selectedItemIndex = indexPath
            districtName = districtsInHanoi[indexPath.row]
            districtCollectionView.reloadData()
            placeCollectionView.reloadData()
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
            bestCell.informationPlaceView.frame.size.width = bestCell.frame.width
            print(bestCell.frame)
            cell = bestCell
        }
        return cell
    }
}

extension HomeViewController: UICollectionViewDelegateFlowLayout {
    //Khoang cach giua cac item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        var interitemSpacing: CGFloat = 0
        if collectionView == districtCollectionView {
            interitemSpacing = 20
        } else if collectionView == placeCollectionView {
            //FIXME: Đang không thay đổi được khoảng cách giữa các item
            interitemSpacing = 30
        } else if collectionView == tagCollectionView {
            //FIXME: Đang không thay đổi được khoảng cách giữa các item
            interitemSpacing = 30
        } else if collectionView == bestPlaceCollectionView {
            interitemSpacing = 10
        }
        return interitemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var sizeForItem: CGSize = CGSize(width: 0, height: 0)
        if collectionView == districtCollectionView {
            let namePlace = districtsInHanoi[indexPath.row] //nội dung muốn hiển thị trong label
            
            // Tạo một UILabel tạm thời với cùng nội dung
            let label = UILabel()
            label.text = namePlace
            label.font = UIFont.systemFont(ofSize: 16) // Chọn font và kích thước sử dụng trong cell
            
            // Tính toán chiều rộng của label dựa trên nội dung của nó
            let maxWidth: CGFloat = collectionView.frame.width // Giới hạn chiều rộng (tùy chỉnh khoảng cách margin)
            let labelSize = label.sizeThatFits(CGSize(width: maxWidth, height: .greatestFiniteMagnitude))
            
            // Trả về kích thước cell với chiều rộng bằng chiều rộng của label và chiều cao cố định
            sizeForItem = CGSize(width: labelSize.width + 2, height: 30) // Chiều rộng = width của label + margin, chiều cao tùy chỉnh
        } else if collectionView == placeCollectionView {
            sizeForItem = CGSize(width: 294, height: 355)
        } else if collectionView == tagCollectionView {
            sizeForItem = CGSize(width: 88, height: 115)
        } else if collectionView == bestPlaceCollectionView {
            // Tính toán kích thước cell để có 2 cột
            let padding: CGFloat = 10 // Khoảng cách giua cac item
            let availableWidth = collectionView.frame.width - padding
            let width = availableWidth / 2 // Hai cột
            let height = width + 10// Hai dòng
            
            sizeForItem = CGSize(width: width, height: height)
        }
        return sizeForItem
    }
}

