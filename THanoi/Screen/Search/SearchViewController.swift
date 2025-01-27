//
//  SearchViewController.swift
//  THanoi
//
//  Created by Tuấn on 26/1/25.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var filterButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpHeader()
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
