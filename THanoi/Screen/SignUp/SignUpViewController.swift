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
    @IBOutlet weak var isFullNameLabel: UILabel!
    @IBOutlet weak var isEmailLabel: UILabel!
    @IBOutlet weak var isPasswordLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = NSLocalizedString("titleSignUp", comment: "")
        descriptionLabel.text = NSLocalizedString("descriptionSignUp", comment: "")
        
        fullNameTextField.imageLeftView(image: "person", placeholder: "fullName")
        emailTextField.imageLeftView(image: "envelope", placeholder: "email")
        passWordTextField.imageLeftView(image: "lock", placeholder: "passWord")
        
        fullNameTextField.delegate = self
        emailTextField.delegate = self
        passWordTextField.delegate = self
        
        fullNameTextField.tag = 1
        emailTextField.tag = 2
        passWordTextField.tag = 3
        
        signUpButton.setUpButton(title: "signUp")
        
        orSignInLabel.text = NSLocalizedString("orSignIn", comment: "")
        
        signInLabel.text = NSLocalizedString("alreadySignIn", comment: "")
        let highLineSignIn = NSAttributedString().highLightText(fullText: NSLocalizedString("alreadySignIn", comment: ""), highLighText: NSLocalizedString("signIn", comment: ""), highLightColor: .color)
        signInLabel.attributedText = highLineSignIn
        //TODO: viet thanh extension
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            view.addGestureRecognizer(tapGesture)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true) // Ẩn bàn phím
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        if let fullName = fullNameTextField.text, !fullName.isEmpty {
            fullNameTextField.layer.borderWidth = 0
            isFullNameLabel.text = ""
        } else {
            showError(textField: fullNameTextField, content: "isFullName", errorLabel: isFullNameLabel)
        }
        
        if isValidEmail(emailTextField) {
            emailTextField.layer.borderWidth = 0
            isEmailLabel.text = ""
        } else {
            showError(textField: emailTextField, content: "isEmail", errorLabel: isEmailLabel)
        }
        
        if isValidPassword(passWordTextField) {
            passWordTextField.layer.borderWidth = 0
            isPasswordLabel.text = ""
        } else {
            showError(textField: passWordTextField, content: "isPassword", errorLabel: isPasswordLabel)
        }
        
        
        if let fullName = fullNameTextField.text, !fullName.isEmpty, isValidEmail(emailTextField), isValidPassword(passWordTextField) {
            print("ok. dang ky")
        } else {
            
        }
        
        
        
    }
    
    func showError(textField: UITextField, content: String, errorLabel: UILabel) {
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.color.cgColor
        errorLabel.text = NSLocalizedString(content, comment: "")
    }
    
    func isValidEmail(_ emailTextField: UITextField) -> Bool {
        let email = emailTextField.text
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    
    func isValidPassword(_ passwordTextField: UITextField) -> Bool {
        // Điều kiện: ít nhất 8 ký tự, 1 chữ hoa, 1 số
        let password = passwordTextField.text
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9]).{8,}$"
        let passwordPredicate = NSPredicate(format: "SELF MATCHES %@", passwordRegex)
        return passwordPredicate.evaluate(with: password)
    }


}

extension SignUpViewController: UITextFieldDelegate {
    //Delegate khi nhan nut return
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            print("Ho va ten")
            view.viewWithTag(2)?.becomeFirstResponder() //chuyen sang textField khac: becomeFirstResponder()
        case 2:
            print("email")
            view.viewWithTag(3)?.becomeFirstResponder()
        case 3:
            print("pass")
            textField.resignFirstResponder() //An ban phim
        default:
            break
        }
        return true
    }
}

