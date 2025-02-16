//
//  SignUpViewController.swift
//  THanoi
//
//  Created by Tuấn on 12/12/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var orSignInLabel: UILabel!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var errorFullNameLabel: UILabel!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var signUpWithApple: UIButton!
    @IBOutlet weak var signUpWithGoogle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let tapSignInLabel = UITapGestureRecognizer(target: self, action: #selector(signInLabelAction))
        signInLabel.addGestureRecognizer(tapSignInLabel)
        addDismissKeyboard()
    }
    
    func setupUI() {
        titleLabel.text = NSLocalizedString("titleSignUp", comment: "")
        descriptionLabel.text = NSLocalizedString("descriptionSignUp", comment: "")
        
        fullNameTextField.imageLeftView(image: "person", placeholder: "fullName")
        fullNameTextField.delegate = self
        fullNameTextField.tag = 1
        
        emailTextField.imageLeftView(image: "envelope", placeholder: "email")
        emailTextField.delegate = self
        emailTextField.tag = 2
        
        passWordTextField.imageLeftView(image: "lock", placeholder: "passWord")
        passWordTextField.delegate = self
        passWordTextField.tag = 3
        
        signUpButton.setUpButton(title: "signUp")
        
        orSignInLabel.text = NSLocalizedString("orSignIn", comment: "")
        
        signInLabel.text = NSLocalizedString("alreadySignIn", comment: "")
        
        let highLineSignIn = NSAttributedString().highLightText(fullText: NSLocalizedString("alreadySignIn", comment: ""), highLighText: NSLocalizedString("signIn", comment: ""), highLightColor: .color)
        signInLabel.attributedText = highLineSignIn
    }
    
    @objc func signInLabelAction() {
        let signInVC = SignInViewController()
        signInVC.modalTransitionStyle = .crossDissolve
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true)
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        
        if let fullName = fullNameTextField.text, !fullName.isEmpty {
            fullNameTextField.layer.borderWidth = 0
            errorFullNameLabel.isHidden = true
        } else {
            showError(textField: fullNameTextField, content: "isFullName", errorLabel: errorFullNameLabel)
        }
        
        if isValidEmail(emailTextField) {
            emailTextField.layer.borderWidth = 0
            errorEmailLabel.isHidden = true
        } else {
            showError(textField: emailTextField, content: "isEmail", errorLabel: errorEmailLabel)
        }
        
        if isValidPassword(passWordTextField) {
            passWordTextField.layer.borderWidth = 0
            errorPasswordLabel.isHidden = true
        } else {
            showError(textField: passWordTextField, content: "isPassword", errorLabel: errorPasswordLabel)
        }
        
        if let fullName = fullNameTextField.text, !fullName.isEmpty, isValidEmail(emailTextField), isValidPassword(passWordTextField) {
            AuthManager.shared.registerUser(email: emailTextField.text!, password: passWordTextField.text!, completion: { success, error, userId in
                if success, let userId = userId {
//                    print(userId)
                    UserManager.shared.saveUserData(userId: userId, name: fullName, email: self.emailTextField.text!, completion: { success, error in
                        if success {
                            let signInVC = SignInViewController()
                            signInVC.modalTransitionStyle = .crossDissolve
                            signInVC.modalPresentationStyle = .fullScreen
                            self.present(signInVC, animated: true)
                        } else {
                            self.showAlert(message: error ?? "")
                        }
                    })
                } else {
                    print(String(error ?? ""))
                    self.showAlert(message: error ?? "")
                }
            })
        }
    }
    
//    func showAlert() {
//        let alert = UIAlertController(title: "Lỗi", message: "Xin vui lòng đăng ký lại!", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "OK", style: .default))
//        self.present(alert, animated: true)
//    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
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

