//
//  SignUpViewController.swift
//  THanoi
//
//  Created by Tuấn on 12/12/24.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var orSignInLabel: UILabel!
    @IBOutlet weak var signInLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = NSLocalizedString("titleSignUp", comment: "")
        descriptionLabel.text = NSLocalizedString("descriptionSignUp", comment: "")
        
        fullNameTextField.imageLeftView(image: "person", placeholder: "fullName")
        emailTextField.imageLeftView(image: "envelope", placeholder: "email")
        passWordTextField.imageLeftView(image: "lock", placeholder: "passWord")
        
        signUpButton.setUpButton(title: "signUp")
        
        orSignInLabel.text = NSLocalizedString("orSignIn", comment: "")
        
        signInLabel.text = NSLocalizedString("alreadySignIn", comment: "")
        let highLineSignIn = NSAttributedString().highLightText(fullText: NSLocalizedString("alreadySignIn", comment: ""), highLighText: NSLocalizedString("signIn", comment: ""), highLightColor: .color)
        signInLabel.attributedText = highLineSignIn
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
