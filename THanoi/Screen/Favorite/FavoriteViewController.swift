//
//  FavoriteViewController.swift
//  THanoi
//
//  Created by Tuấn on 7/2/25.
//

import UIKit
import SwipeCellKit

class FavoriteViewController: UIViewController {

    @IBOutlet weak var favoritePlaceTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoritePlaceTableView.dataSource = self
        favoritePlaceTableView.delegate = self
        
        favoritePlaceTableView.register(UINib(nibName: "FavoritePlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "FavoritePlaceTableViewCell")
        
    }
}

extension FavoriteViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let witdhCell = UIScreen.main.bounds.width
        let height = witdhCell * 0.2 + 20 //vi image co w=h mà w = 0.15 * wCell và 20 là khoảng cách top va bottom
        
        return height
    }
}

extension FavoriteViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritePlaceTableViewCell", for: indexPath) as! FavoritePlaceTableViewCell
        
        cell.selectionStyle = .none
        
        return cell
    }
    
}

//extension FavoriteViewController: SwipeTableViewCellDelegate {
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeCellKit.SwipeActionsOrientation) -> [SwipeCellKit.SwipeAction]? {
//        guard orientation == .right else { return nil}
//        
//        let deleteAction = SwipeAction(style: .destructive, title: nil, handler: { action, indexPath in
//            print("Da xoa item \(indexPath.row)")
//        })
//        
//        deleteAction.image = UIImage(systemName: "trash.fill")
//        
//        return [deleteAction]
//    }
//}
