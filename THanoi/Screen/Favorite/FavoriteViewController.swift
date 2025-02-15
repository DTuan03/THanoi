//
//  FavoriteViewController.swift
//  THanoi
//
//  Created by Tuấn on 7/2/25.
//

import UIKit
import SwipeCellKit
import Kingfisher

class FavoriteViewController: UIViewController {
    
    @IBOutlet weak var favoritePlaceTableView: UITableView!
    var sortFavorites: [Favorite]!
    
    var favorites: [Favorite] = []
    
    var openedCellIndexPath: IndexPath?
    
    init(favorites: [Favorite]) {
        self.favorites = favorites
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.favorites = []
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateDataTableView()
        
        favoritePlaceTableView.dataSource = self
        favoritePlaceTableView.delegate = self
        
        favoritePlaceTableView.register(UINib(nibName: "FavoritePlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritePlaceTableViewCell")
        
        enableSwipeBack()
    }
    
    func updateDataTableView() {
        sortFavorites = self.favorites.sorted { $0.createdAt > $1.createdAt}
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let witdhCell = UIScreen.main.bounds.width
        //image co w=h mà w = 0.15 * wCell và 20 là khoảng cách top va bottom
        let height = witdhCell * 0.2 + 20
        
        return height
    }
    
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sortFavorites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritePlaceTableViewCell", for: indexPath) as! FavoritePlaceTableViewCell
        
        cell.selectionStyle = .none
        
        let placeId = sortFavorites[indexPath.row].placedId
        
        let place = places.first(where: { $0.id == placeId })
        
        let urlImage = URL(string: place?.avatar ?? "")
        cell.avatarPlaceImageView.kf.setImage(with: urlImage)
        cell.nameLabel.text = place?.name
        cell.addressLabel.text = place?.address
        let stringAvgRating = place?.avgRating != nil ? String(format: "%.1f", (place?.avgRating)!) : "0.0"
        cell.avgRatingLabel.text = String(stringAvgRating)
        
        
        cell.onTapContainerView = { [weak self] in
            let detailVC = DetailViewController()
            detailVC.placeId = self?.sortFavorites[indexPath.row].placedId
            self?.navigationController?.pushViewController(detailVC, animated: true)
        }
        
        cell.onTapDeleteView = { [weak self] in
            let alert = UIAlertController(title: "Xoá", message: "Bạn có chắc chắn muốn xoá không?", preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                self?.favoritePlaceTableView.setEditing(false, animated: false)
                self?.sortFavorites.remove(at: indexPath.row)
                self?.favoritePlaceTableView.deleteRows(at: [indexPath], with: .automatic)
                self?.favoritePlaceTableView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: .none)
            
            alert.addAction(okAction)
            alert.addAction(cancelAction)
            
            self?.present(alert, animated: true)
        }
        return cell
    }
   
}


