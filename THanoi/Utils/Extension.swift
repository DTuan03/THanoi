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
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 45, height: 45))
        let imageView = UIImageView(image: UIImage(systemName: image))
        imageView.tintColor = .black
        imageView.frame = CGRect(x: 10, y: 10, width: 25, height: 25)
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
        self.view.endEditing(true) // Ẩn bàn phím
    }
}
