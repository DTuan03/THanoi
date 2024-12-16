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
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 40))
        let imageView = UIImageView(image: UIImage(systemName: image))
        imageView.tintColor = .black
        imageView.frame = CGRect(x: 20, y: 10, width: 25, height: 20)
        paddingView.addSubview(imageView)
        
        self.backgroundColor = UIColor(red: 244/255, green: 243/255, blue: 246/255, alpha: 1)
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
