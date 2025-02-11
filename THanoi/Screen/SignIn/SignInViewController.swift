//
//  SignInViewController.swift
//  THanoi
//
//  Created by Tuấn on 16/12/24.
//

import UIKit

class SignInViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var forgotPasswordLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var orSignIn: UILabel!
    @IBOutlet weak var orSignUp: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = NSLocalizedString("titleSignIn", comment: "")
        descriptionLabel.text = NSLocalizedString("descriptionSignIn", comment: "")
        
        emailTextField.imageLeftView(image: "envelope", placeholder: "email")
        passwordTextField.imageLeftView(image: "lock", placeholder: "passWord")
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        emailTextField.tag = 1
        passwordTextField.tag = 2
        
        forgotPasswordLabel.text = NSLocalizedString("forgotPassWord", comment: "")
        signInButton.setUpButton(title: "signIn")
        
        orSignUp.text = NSLocalizedString("notSignUp", comment: "")
        let highLineSignUp = NSAttributedString().highLightText(fullText: NSLocalizedString("notSignUp", comment: ""), highLighText: NSLocalizedString("signUp", comment: ""), highLightColor: .color)
        orSignUp.attributedText = highLineSignUp
        orSignUp.isUserInteractionEnabled = true
        let tapSignUp = UITapGestureRecognizer(target: self, action: #selector(signUpLabelAction))
        orSignUp.addGestureRecognizer(tapSignUp)
        addDismissKeyboard()
    }
    
    @objc func signUpLabelAction() {
        let signUpVC = SignUpViewController()
        signUpVC.modalTransitionStyle = .crossDissolve
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true)
    }
    
    @IBAction func signInAction(_ sender: Any) {
        if isValidEmail(emailTextField) {
            emailTextField.layer.borderWidth = 0
            errorEmailLabel.isHidden = true
        } else {
            showError(textField: emailTextField, content: "isEmail", errorLabel: errorEmailLabel)
        }
        
        if isValidPassword(passwordTextField) {
            passwordTextField.layer.borderWidth = 0
            errorPasswordLabel.isHidden = true
        } else {
            showError(textField: passwordTextField, content: "isPassword", errorLabel: errorPasswordLabel)
        }
        
        if isValidEmail(emailTextField), isValidPassword(passwordTextField) {
            print("ok. dang nhap")
            let tabbarVC = TabBarViewController()
            tabbarVC.modalTransitionStyle = .crossDissolve
            tabbarVC.modalPresentationStyle = .fullScreen
            present(tabbarVC, animated: true)
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

extension SignInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            view.viewWithTag(2)?.becomeFirstResponder()
        case 2:
            textField.resignFirstResponder()
        default:
            break
        }
        return true
    }
}
