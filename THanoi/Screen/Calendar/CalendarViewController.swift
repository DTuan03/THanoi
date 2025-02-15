//
//  CalendarViewController.swift
//  THanoi
//
//  Created by Tuấn on 6/2/25.
//

import UIKit
import FSCalendar
import SwipeCellKit
import Kingfisher

class CalendarViewController: UIViewController {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var calendar: FSCalendar!
    @IBOutlet weak var selectedDateLabel: UILabel!
    @IBOutlet weak var currentDateLabel: UILabel!
    @IBOutlet weak var plannedPlaceTableView: UITableView!
    
    var selectedDate: String!
    let dateFormatter = DateFormatter()
    var placesForSelectedDate: [Calendar]? = []
    
    var calendars: [Calendar] = []
    
    init(calendars: [Calendar]) {
        self.calendars = calendars
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        self.calendars = []
        super.init(coder: coder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupContainerView()
        
        dateFormatter.dateFormat = "dd MMMM yyyy"
        selectedDate = dateFormatter.string(from: Date())
        selectedDateLabel.text = selectedDate
        updateTableView(date: selectedDate)
        
        setupCalendar()
        
        calendar.delegate = self
        
        let currentDateTap = UITapGestureRecognizer(target: self, action: #selector(scrollCurrentDate))
        currentDateLabel.isUserInteractionEnabled = true
        currentDateLabel.addGestureRecognizer(currentDateTap)
        
        setupTableView()
        enableSwipeBack()
    }
    
    func setupContainerView() {
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.lightGray.cgColor
        containerView.layer.shadowRadius = 1
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
    }
    
    func setupTableView() {
        plannedPlaceTableView.dataSource = self
        plannedPlaceTableView.delegate = self
        plannedPlaceTableView.register(UINib(nibName: "PlannedPlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "PlannedPlaceTableViewCell")
        
        //        plannedPlaceTableView.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        //        plannedPlaceTableView.contentInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        //        plannedPlaceTableView.estimatedRowHeight = 30
        //        plannedPlaceTableView.rowHeight = UITableView.automaticDimension
    }
    
    @objc func scrollCurrentDate() {
        selectedDate = dateFormatter.string(from: Date())
        selectedDateLabel.text = selectedDate
        calendar.setCurrentPage(Date(), animated: true)
        calendar.select(Date())
        updateTableView(date: selectedDate)
    }
    
    func updateTableView(date: String) {
        placesForSelectedDate = calendars.filter { $0.addedDate == date}
        
        //sap xep theo da di hay chua
        placesForSelectedDate?.sort { !$0.isVisited && $1.isVisited}
        
//        placesForSelectedDate?.sort { $0.createdAt < $1.createdAt}
        
        plannedPlaceTableView.reloadData()
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
        
        selectedDate = dateFormatter.string(from: date)
        
        selectedDateLabel.text = selectedDate
        
        updateTableView(date: selectedDate)
    }
}

extension CalendarViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let witdhCell = UIScreen.main.bounds.width
//        //image co w=h mà w = 0.15 * wCell và 20 là khoảng cách top va bottom
//        let height = witdhCell * 0.15 + 20
        return UIScreen.main.bounds.width * 0.15 + 20
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        detailVC.placeId = placesForSelectedDate?[indexPath.row].placedId
        navigationController?.pushViewController(detailVC, animated: true)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true

    }
}

extension CalendarViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return placesForSelectedDate?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlannedPlaceTableViewCell", for: indexPath) as! PlannedPlaceTableViewCell
        
        cell.selectionStyle = .none
        
        cell.delegate = self
        
        let selectedPlaceId = placesForSelectedDate?[indexPath.row].placedId
        
        let place = places.filter { $0.id == selectedPlaceId }
        
        guard let selectedPlace = place.first else {
            return cell
        }
        let urlImage = URL(string: selectedPlace.avatar ?? "")
        cell.avatarPlaceImageView.kf.setImage(with: urlImage)
        cell.namePlaceLabel.text = selectedPlace.name
        cell.addressLabel.text = selectedPlace.address
        
        if placesForSelectedDate?[indexPath.row].isVisited ?? false {
            cell.isVisitedImageView.image = UIImage(systemName: "checkmark.circle.fill")
        } else {
            cell.isVisitedImageView.image = UIImage(systemName: "circle")
        }
        
        cell.onCheckmarkTapped = { [weak self] in
            self?.placesForSelectedDate?[indexPath.row].isVisited.toggle()
//            tableView.reloadRows(at: [indexPath], with: .automatic)
            tableView.reloadData()
            
            if let index = self?.calendars.firstIndex(where: { $0.placedId == selectedPlaceId}) {
                self?.calendars[index].isVisited.toggle()
            }
        }
                
        return cell
    }
}

extension CalendarViewController: SwipeTableViewCellDelegate {
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        guard orientation == .right else { return nil }
        
        let deleteAction = SwipeAction(style: .destructive, title: nil ) { action, indexPath in
            let notifiDeleteAlert = UIAlertController(title: "Xoá", message: "Bạn có chắc chắn muốn xoá địa điểm này không?", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default) { _ in
                guard let placeId = self.placesForSelectedDate?[indexPath.row].placedId else {return}
                
                self.placesForSelectedDate?.remove(at: indexPath.row)
                
                if let index = self.calendars.firstIndex(where: { $0.placedId == placeId }) {
                    self.calendars.remove(at: index)
                }
                
                self.updateTableView(date: self.selectedDate ?? "")
                self.plannedPlaceTableView.reloadData()
            }
            let cancelAction = UIAlertAction(title: "Huỷ", style: .cancel, handler: nil)
            
            notifiDeleteAlert.addAction(okAction)
            notifiDeleteAlert.addAction(cancelAction)
            self.present(notifiDeleteAlert, animated: true, completion: nil)
        }
        
        deleteAction.image = UIImage(systemName: "trash.fill")
        
        return [deleteAction]
    }
    
    
}
