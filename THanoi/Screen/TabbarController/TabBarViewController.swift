//
//  TabBarViewController.swift
//  THanoi
//
//  Created by Tuấn on 25/1/25.
//

import UIKit

class TabBarViewController: UIViewController {
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var homeImageView: UIImageView!
    @IBOutlet weak var homeLabel: UILabel!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var calendarImageView: UIImageView!
    @IBOutlet weak var calendarLabel: UILabel!
    @IBOutlet weak var favoriteView: UIView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var favoriteLabel: UILabel!
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var tabBarView: UIView!
    @IBOutlet weak var contentView: UIView!
    
    private var childVCs: [UIViewController] = []
    private var currentVC: UIViewController?
    private var imageViews: [UIImageView] = []
    private var labels: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBarView.layer.cornerRadius = 30
        tabBarView.layer.borderWidth = 1
        tabBarView.layer.borderColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        tabBarView.layer.masksToBounds = true
                
        childVCs = [
            HomeViewController(),
            CalendarViewController(calendars: calendars),
            FavoriteViewController(favorites: favorites),
            AccountViewController()
        ]
        
        imageViews = [homeImageView, calendarImageView, favoriteImageView, accountImageView]
        labels = [homeLabel, calendarLabel, favoriteLabel, accountLabel]
        
        addGesture(to: homeView, index: 0)
        addGesture(to: calendarView, index: 1)
        addGesture(to: favoriteView, index: 2)
        addGesture(to: accountView, index: 3)
        
        switchToViewController(at: 0)
        labels[0].textColor = UIColor.color
        imageViews[0].tintColor = UIColor.color
        
    }
    
    private func addGesture(to view: UIView, index: Int) {
        let tap = UITapGestureRecognizer(target: self, action: #selector(updateContentView(_:)))
        view.tag = index
        view.addGestureRecognizer(tap)
    }
    
    //    Su sung tag thay the cho index
    @objc func updateContentView(_ sender: UITapGestureRecognizer) {
        guard let tappedView = sender.view else { return }
        switchToViewController(at: tappedView.tag)
        changeColor(at: tappedView.tag)
    }
    
    private func switchToViewController(at index: Int) {
        // Kiem tra, xoa vc hiện tại
        if let currentVC = currentVC {
            //Thong bao cho currentVC sap bị gỡ khỏi cay cha
            currentVC.willMove(toParent: nil)
            //gỡ khỏi màn hình
            currentVC.view.removeFromSuperview()
            //gỡ luôn khỏi vc cha
            currentVC.removeFromParent()
            
        }
        
        // Them moi vC
        let newVC = childVCs[index]
        addChild(newVC)
        contentView.addSubview(newVC.view)
        newVC.view.frame = contentView.bounds
        //Luôn khớp với kích thước của contentView khi có sự thay đổi w, h
        newVC.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        //Thong bao da them thanh cong
        newVC.didMove(toParent: self)
        
        // Cap nhat vc
        currentVC = newVC
    }
    
    private func changeColor(at index: Int) {
        for item in 0...3 {
            labels[item].font = UIFont.systemFont(ofSize: 13)
            labels[item].textColor = UIColor.darkGray
            imageViews[item].tintColor = UIColor.darkGray
        }
        labels[index].font = UIFont.boldSystemFont(ofSize: 13)
        labels[index].textColor = UIColor.color
        imageViews[index].tintColor = UIColor.color
    }
}
