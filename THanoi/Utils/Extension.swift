//
//  NSAttributedString.swift
//  THanoi
//
//  Created by Tuấn on 11/12/24.
//

import Foundation
import UIKit

extension NSAttributedString {
    func highLightText(fullText: String, highLighText: String, highLightColor: UIColor) -> NSMutableAttributedString {
        let mutableAttributedString =  NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: highLighText)
        mutableAttributedString.addAttribute(.foregroundColor, value: highLightColor, range: range)
        
        return mutableAttributedString
    }
}

extension UITextField {
    func imageLeftView(image: String, placeholder: String) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let imageView = UIImageView(image: UIImage(systemName: image))
        imageView.tintColor = .black
        //Công thuc căn giữa 1 view: (containerW - w) / 2
        imageView.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        imageView.contentMode = .scaleAspectFill
        paddingView.addSubview(imageView)
        
        self.backgroundColor = UIColor(red: 244/256, green: 243/256, blue: 246/256, alpha: 1)
        self.layer.cornerRadius = 15
        self.placeholder = NSLocalizedString(placeholder, comment: "")
        self.leftView = paddingView
        self.leftViewMode = .always
        self.keyboardType = .default
        if placeholder == "passWord" {
            self.isSecureTextEntry = true
        }
        if placeholder == "email" {
            self.keyboardType = .emailAddress
        }
    }
    
    func imageRightView(image: String, placeholder: String = "") {
        
        
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        let imageView = UIImageView(image: UIImage(systemName: image))
        imageView.tintColor = .black
        //Công thuc căn giữa 1 view: (containerW - w) / 2
        imageView.frame = CGRect(x: 15, y: 15, width: 20, height: 20)
        imageView.contentMode = .scaleAspectFill
        paddingView.addSubview(imageView)
        
        self.backgroundColor = UIColor(red: 244/256, green: 243/256, blue: 246/256, alpha: 1)
        self.layer.cornerRadius = 15
        if !placeholder.isEmpty {
            self.placeholder = NSLocalizedString(placeholder, comment: "")
        }
        self.rightView = paddingView
        self.rightViewMode = .always
        self.keyboardType = .default

        let tap = UITapGestureRecognizer(target: self, action: #selector((toggleSecureTextEntry(_:))))
        paddingView.addGestureRecognizer(tap)
    }
    
    @objc func toggleSecureTextEntry(_ sender: UITapGestureRecognizer) {
        if let paddingView = sender.view, let imageView = paddingView.subviews.first as? UIImageView {
            if self.isSecureTextEntry {
                self.isSecureTextEntry = false
                imageView.image = UIImage(systemName: "eyes")
            } else {
                self.isSecureTextEntry = true
                imageView.image = UIImage(systemName: "eyebrow")
            }
        }
    }
}

extension UIButton {
    func setUpButton(title: String) {
        self.setTitle(NSLocalizedString(title, comment: ""), for: .normal)
        self.tintColor = .white
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        self.backgroundColor = .color
        self.layer.cornerRadius = 15
    }
}

extension UIViewController {
    func addDismissKeyboard() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    //Hàm bật Gesture (vuốt từ trái sang phải để quay về màn cũ, vì đã tắt bên sceneDelegate)
    func enableSwipeBack() {
        navigationController?.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
    }
}

extension Date {
    func toVietnameseDateString() -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.locale = Locale(identifier: "vi_VN")
        
        dateFormatter.dateFormat = "d MMMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}

