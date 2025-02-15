//
//  RecentSearchViewController.swift
//  THanoi
//
//  Created by Tuấn on 28/1/25.
//

import UIKit

class RecentSearchViewController: UIViewController {
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var historySearchTableView: UITableView!
    @IBOutlet weak var backImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpHeader()
        
        historySearchTableView.delegate = self
        historySearchTableView.dataSource = self
        
        historySearchTableView.register(UINib(nibName: "SearchItemTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchItemTableViewCell")
        historySearchTableView.separatorStyle = .none
        
        let backImageTap = UITapGestureRecognizer(target: self, action: #selector(backScreen(_:)))
        backImageView.addGestureRecognizer(backImageTap)
        
        addDismissKeyboard()
    }
    
    @objc func backScreen(_ hanlder: UITapGestureRecognizer) {
        navigationController?.popViewController(animated: true)
    }
    
    func setUpHeader() {
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

extension RecentSearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let soCell = Int(tableView.frame.size.height / 110)
        return soCell
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchItemTableViewCell", for: indexPath) as! SearchItemTableViewCell
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 20, right: 0)
        
        return cell
    }
}

extension RecentSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let witdhCell = UIScreen.main.bounds.width
        let height = witdhCell * 0.2 + 20 //vi image co w=h mà w = 0.15 * wCell và 20 là khoảng cách top va bottom
        
        return height
    }
}
