//
//  DetailViewController.swift
//  THanoi
//
//  Created by Tuấn on 31/1/25.
//

import UIKit
import Cosmos
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var containerBackView: UIView!
    @IBOutlet weak var favoriteImageView: UIImageView!
    @IBOutlet weak var containerFavoriteView: UIView!
    @IBOutlet weak var calendarImageView: UIImageView!
    @IBOutlet weak var containerCalendarView: UIView!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageCollectionView: UICollectionView!
    @IBOutlet weak var indexImageView: UIPageControl!
    @IBOutlet weak var ratingView: CosmosView!
    @IBOutlet weak var avatarUserImageView: UIImageView!
    @IBOutlet weak var reviewTextView: UITextView!
    @IBOutlet weak var reviewTableView: UITableView!
    @IBOutlet weak var namePlaceLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var avgRatingLabel: UILabel!
    @IBOutlet weak var totalCommentLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var heightReviewTableView: NSLayoutConstraint!
    var topInset: Int = 0
    var placeId: String!
    var place: PlaceModel?
    var progressViews: [UIProgressView] = []
    let weatherService = WeatherService()
    var weathers: [WeatherInfo] = []
    var day: [String] = []
    let userId = UserDefaults.standard.string(forKey: "userId")!
    let places: [PlaceModel] = PlaceDataManager.shared.places
    var favoritePlaceId: [String] = []
    var isFavorite: String = ""
    var reviews = ReviewdDataManager.shared.reviews
    
    override func viewWillAppear(_ animated: Bool) {
        FavoriteDataManager.shared.loadFavoritePlaceId(userId: userId, completion: { data in
            self.favoritePlaceId = data
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FavoriteDataManager.shared.loadFavoritePlaceId(userId: userId, completion: { data in
            self.favoritePlaceId = data
            
            DispatchQueue.main.async {
                self.isFavorite = self.favoritePlaceId.first(where: { $0 == self.placeId}) ?? ""
                
                if let _ = self.placeId, !self.isFavorite.isEmpty {
                    self.favoriteImageView.image = UIImage(systemName: "heart.fill")
                    self.favoriteImageView.tintColor = .red
                }
            }
        })
        setupData()
        setupUI()
        setupAction()
        
        simulate()
        getWeather()
        
        getNextThreeDaysOfWeek()
        
        setupScrollView()
        
        setupCollectionView()
        setupIndexImageView()
        setupRatingView()
                
        setupReviewTableView()
        
        enableSwipeBack()
        
        addDismissKeyboard()
    }
    private func setupUI() {
        containerBackView.layer.cornerRadius = containerBackView.frame.width / 2
        containerFavoriteView.layer.cornerRadius = containerFavoriteView.frame.width / 2
        containerCalendarView.layer.cornerRadius = containerCalendarView.frame.width / 2
        
        avatarUserImageView.layer.cornerRadius = avatarUserImageView.frame.size.width / 2
        
        reviewTextView.layer.cornerRadius = 10
        reviewTextView.layer.borderWidth = 1
        reviewTextView.layer.borderColor = UIColor.lightGray.cgColor
        
    }
    
    private func setupScrollView() {
        scrollView.delegate = self
        scrollView.bounces = false
    }
    
    private func setupData() {
        if let placeId = placeId, let tempPlace = places.first(where: { $0.id == placeId }) {
            place = tempPlace
            namePlaceLabel.text = place?.name
            addressLabel.text = place?.address
            avgRatingLabel.text = String(place?.avgRating ?? 0)
            totalCommentLabel.text = String(place?.totalReviews ?? 0) + " Phản hồi"
            ownerLabel.text = "by " + (place?.ownerName ?? "")
            descriptionLabel.text = place?.description
        }
    }
    
    private func setupAction() {
        let backImageViewTap = UITapGestureRecognizer(target: self, action: #selector(backScreen))
        backImageView.addGestureRecognizer(backImageViewTap)
        
        let favoriteImageViewTap = UITapGestureRecognizer(target: self, action: #selector(addFavorite))
        favoriteImageView.addGestureRecognizer(favoriteImageViewTap)
        
        let calendarImageViewTap = UITapGestureRecognizer(target: self, action: #selector(addCalendar))
        calendarImageView.addGestureRecognizer(calendarImageViewTap)
    }
    
    @IBAction func submitReview(_ sender: Any) {
        guard ratingView.rating > 0 else {
            showAlert(title: "Thông báo", message: "Hãy chọn số sao phù hợp bằng cách giữ và kéo!")
            return
        }
        
        let comment = reviewTextView.text ?? ""
        var ratingValue = 0.0
        let currentDate = ""
        ratingView.didFinishTouchingCosmos = { rating in
            ratingValue = rating
        }
        
        UserManager.shared.featchUser(userId: userId, completion: { user in
            ReviewdDataManager.shared.addReview(userId: user.userId, userName: user.name, placedId: self.placeId, avatarUser: user.avatar ?? "", rating: Int(ratingValue), comment: comment, timestamp: currentDate, completion: { error in
                if error {
                    print("Loi")
                } else {
                    print("Thanh cong")
                }
            })
        })
    }
    
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alert, animated: true)
    }
    
    @objc func addFavorite() {
        let isAdding = isFavorite.isEmpty
        isFavorite = isAdding ? placeId : ""
        
        favoriteImageView.image = UIImage(systemName: isAdding ? "heart.fill" : "heart")
        favoriteImageView.tintColor = isAdding ? .red : .black
        
        if isAdding {
            FavoriteDataManager.shared.updateFavoritePlace(userId: userId, placedId: placeId) { self.favoritePlaceId = $0 }
        } else {
            FavoriteDataManager.shared.deleteFavoritePlace(userId: userId, placedId: placeId) { self.favoritePlaceId = $0 }
        }
    }
    
    @objc func addCalendar() {
        let alert = UIAlertController(title: "Chọn ngày dự định đi", message: nil, preferredStyle: .actionSheet)
        
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
        datePicker.minimumDate = Date()
        
        alert.view.addSubview(datePicker)
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        alert.view.heightAnchor.constraint(equalToConstant: 350).isActive = true
        NSLayoutConstraint.activate([
            datePicker.leadingAnchor.constraint(equalTo: alert.view.leadingAnchor),
            datePicker.trailingAnchor.constraint(equalTo: alert.view.trailingAnchor),
            datePicker.topAnchor.constraint(equalTo: alert.view.topAnchor, constant: 40),
            datePicker.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        let okAction = UIAlertAction(title: "Chọn", style: .default) { _ in
            let formattedDate = datePicker.date.toVietnameseDateString()

            CalendarDataManager.shared.addCalendar(userId: self.userId, placeId: self.placeId, scheduledDate: formattedDate, completion: { success in
                if success {
                    print("Da them")
                } else {
                    print("Loi")
                }
                
            })
        }
        let cancelAction = UIAlertAction(title: "Hủy", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    @objc func backScreen() {
        navigationController?.popViewController(animated: true)
    }
    
    func setupContainerBackView() {
        containerBackView.layer.cornerRadius = containerBackView.frame.width / 2
        containerFavoriteView.layer.cornerRadius = containerFavoriteView.frame.width / 2
        containerCalendarView.layer.cornerRadius = containerCalendarView.frame.width / 2
    }
    
    func setupIndexImageView() {
        indexImageView.numberOfPages = place?.images?.count ?? 1
        if let indexPath = imageCollectionView.indexPathsForVisibleItems.first {
            indexImageView.currentPage = indexPath.row
        }
    }
    
    func setupCollectionView() {
        imageCollectionView.delegate = self
        imageCollectionView.dataSource = self
        
        imageCollectionView.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
        imageCollectionView.bounces = false
        imageCollectionView.isPagingEnabled = true
        imageCollectionView.showsHorizontalScrollIndicator = false
        
        weatherCollectionView.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.register(UINib(nibName: "WeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "WeatherCollectionViewCell")
    }
    
    func setupRatingView() {
        ratingView.settings.totalStars = 5
        ratingView.settings.fillMode = .full
        ratingView.rating = 1
        ratingView.settings.starSize = 25
        ratingView.settings.emptyBorderWidth = 2
        //        ratingView.settings.
    }
    
    func setupReviewTableView() {
        reviewTableView.dataSource = self
        reviewTableView.delegate = self
        
        reviewTableView.register(UINib(nibName: "ReviewTableViewCell", bundle: nil), forCellReuseIdentifier: "ReviewTableViewCell")
        reviewTableView.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
    var imageScrollTimer: Timer?
    var currentImageIndex: Int = 0
    
    func simulate() {
        imageScrollTimer?.invalidate()
        imageScrollTimer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateImageScroll), userInfo: nil, repeats: true)
    }
    
    @objc func updateImageScroll() {
        currentImageIndex = (currentImageIndex + 1)/* % imageCount*/
        indexImageView.currentPage = currentImageIndex % (place?.images!.count ?? 0)
        
        let nextIndexPath = IndexPath(item: currentImageIndex, section: 0)
        
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.imageCollectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: true)
        })
        
        if currentImageIndex == 0 {
            imageScrollTimer?.invalidate()
            imageScrollTimer = nil
            simulate()
        }
    }
    
    func getWeather() {
        weatherService.fetchWeather(lat: 21.0285, lon: 105.8544) { weatherList in
            DispatchQueue.main.async {
                if let weatherList = weatherList {
                    self.weathers = weatherList
                    self.weatherCollectionView.reloadData()
                    
                } else {
                    print("Không thể lấy dữ liệu thời tiết.")
                }
            }
        }
    }
    
    private func getNextThreeDaysOfWeek() {
        var daysOfWeek: [String] = []
        let calendar = NSCalendar.current
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        dateFormatter.locale = Locale(identifier: "vi_VN")
        
        for i in 0..<3 {
            if let date = calendar.date(byAdding: .day, value: i, to: Date()) {
                let dayOfWeek = dateFormatter.string(from: date)
                daysOfWeek.append(dayOfWeek)
            }
        }
        
        self.day = daysOfWeek
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        topInset = Int(view.safeAreaInsets.top)
        contentView.layoutIfNeeded()
        reviewTableView.layoutIfNeeded()
        heightReviewTableView.constant = reviewTableView.contentSize.height
    }
}

extension DetailViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == self.scrollView {
            let offsetY = scrollView.contentOffset.y
            
            let maxOffset: CGFloat = imageCollectionView.frame.height - backView.frame.height
            
            let alpha = min(1, max(0, offsetY / maxOffset))
            backView.alpha = alpha
        }
    }
}

extension DetailViewController: UICollectionViewDelegate {
}

extension DetailViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == imageCollectionView {
            return 1000
        } else {
            return weathers.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell!
        if collectionView == imageCollectionView {
            let imageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
            
            let realIndex = indexPath.row % (place?.images!.count ?? 0)
            let urlImage = URL(string: place?.images?[realIndex] ?? "")
            imageCell.image.kf.setImage(with: urlImage)
            
            
            cell = imageCell
        } else {
            let weatherCell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCollectionViewCell", for: indexPath) as! WeatherCollectionViewCell

            weatherCell.dayLabel.text = self.day[indexPath.row]
            let tempMin = (self.weathers[indexPath.row].main.temp_min * 10).rounded() / 10
            let tempMax = (self.weathers[indexPath.row].main.temp_max * 10).rounded() / 10
            weatherCell.tempLabel.text = String(tempMin) + " - " + String(tempMax) + "°C"
            
            let icon = self.weathers[indexPath.row].weather[0].icon
            let url = "https://openweathermap.org/img/wn/" + icon + ".png"
            weatherCell.weatherImageView.kf.setImage(with: URL(string: url))
            
            cell = weatherCell
        }
        return cell
    }
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == imageCollectionView {
            return CGSize(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height * 0.45)
        } else {
            return CGSize(width: (UIScreen.main.bounds.size.width - 60) / 3, height: 150)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

extension DetailViewController: UITableViewDelegate {
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewTableViewCell", for: indexPath) as! ReviewTableViewCell
        cell.selectionStyle = .none
        
        return cell
    }
}
