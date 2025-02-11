//
//  CalendarViewController.swift
//  THanoi
//
//  Created by Tuấn on 6/2/25.
//

import UIKit
import FSCalendar
import SwipeCellKit

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var selectionDateLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var plannedPlaceTableView: UITableView!
    
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = false
        
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowRadius = 1
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0) // Hướng và vị trí của bóng (4 cạnh)
        
        
        dateFormatter.dateFormat = "dd MMMM"
        selectionDateLabel.text = dateFormatter.string(from: Date())
        
        setupCalendar()
        
        calendar.delegate = self
        
        let currentDateTap = UITapGestureRecognizer(target: self, action: #selector(scrollCurrentDate))
        currentDateLabel.isUserInteractionEnabled = true
        currentDateLabel.addGestureRecognizer(currentDateTap)
        
        plannedPlaceTableView.dataSource = self
        plannedPlaceTableView.delegate = self
        
        plannedPlaceTableView.register(UINib(nibName: "PlannedPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlannedPlaceTableViewCell")
        
//        plannedPlaceTableView.separatorInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
//        plannedPlaceTableView.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        plannedPlaceTableView.estimatedRowHeight = 30
        plannedPlaceTableView.rowHeight = UITableView.automaticDimension

    }
    
    @objc func scrollCurrentDate() {
        selectionDateLabel.text = dateFormatter.string(from: Date())
        
        //Cuộn đến ngày hiện tại
        calendar.setCurrentPage(Date(), animated: true)
        calendar.select(Date()) //chọn ngày hiện tại
    }
    
    func setupCalendar() {
        calendar.scope = .week // hiển thị theo tuần
        
        calendar.headerHeight = 0 // ẩn tháng
        
        calendar.appearance.weekdayTextColor = UIColor.gray
        calendar.appearance.todayColor = UIColor.clear
        calendar.appearance.titleTodayColor = UIColor.orange
        calendar.appearance.selectionColor = UIColor.orange
        calendar.appearance.titleSelectionColor = UIColor.white
        calendar.weekdayHeight = 25
        
        calendar.select(Date()) //chọn ngày hiện tại
        
        //        calendar.appearance.borderRadius = 0.25  Bo góc ngày (0.5 là tròn)
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 16, weight: .medium) // Font chữ ngày
        calendar.appearance.weekdayFont = UIFont.systemFont(ofSize: 16, weight: .medium) // Font chữ thứ
        
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0 // Ẩn mờ khi vuốt tháng
        //        calendar.appearance.headerTitleAlignment = .left // Canh giữa
    }
}

extension CalendarViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        
        let selectedDate = dateFormatter.string(from: date)
        
        selectionDateLabel.text = selectedDate
    }
}

extension CalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let witdhCell = UIScreen.main.bounds.width
        let height = witdhCell * 0.15 + 20 //vi image co w=h mà w = 0.15 * wCell và 20 là khoảng cách top va bottom
        
        return height
    }
}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlannedPlaceTableViewCell", for: indexPath) as! PlannedPlaceTableViewCell
        
        cell.selectionStyle = .none
        
        cell.delegate = self
        
        return cell
    }
}

extension CalendarViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        guard orientation == .right else { return nil } //Kiểm tra hướng vuối của cell trong Swipe, nếu kh phải vuốt phải thì trả về nil
        
        //Tao hanh dong xoa
        let deleteAction = SwipeAction(style: .destructive, title: nil, handler: { action, indexPath in
            print("Đã xóa item tại \(indexPath.row)")
        })
        
        // Thêm icon
        deleteAction.image = UIImage(systemName: "trash.fill")
        
        return [deleteAction]
    }
}
