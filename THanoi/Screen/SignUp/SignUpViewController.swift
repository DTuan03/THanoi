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
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var orSignInLabel: UILabel!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var errorFullNameLabel: UILabel!
    @IBOutlet weak var errorEmailLabel: UILabel!
    @IBOutlet weak var errorPasswordLabel: UILabel!
    @IBOutlet weak var signUpWithAppleButton: UIButton!
    @IBOutlet weak var signUpWithGoogleButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        let tapSignInLabel = UITapGestureRecognizer(target: self, action: #selector(handleSignInTap))
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
        
        passwordTextField.imageLeftView(image: "lock", placeholder: "passWord")
        passwordTextField.delegate = self
        passwordTextField.tag = 3
        
        signUpButton.setUpButton(title: "signUp")
        
        orSignInLabel.text = NSLocalizedString("orSignIn", comment: "")
        
        signInLabel.text = NSLocalizedString("alreadySignIn", comment: "")
        
        let highLineSignIn = NSAttributedString().highLightText(fullText: NSLocalizedString("alreadySignIn", comment: ""), highLighText: NSLocalizedString("signIn", comment: ""), highLightColor: .color)
        signInLabel.attributedText = highLineSignIn
    }
    
    @objc func handleSignInTap() {
        let signInVC = SignInViewController()
        signInVC.modalTransitionStyle = .crossDissolve
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true)
    }
    
    
    @IBAction func signUpAction(_ sender: Any) {
        let fullName = fullNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        var hasError = false
        
        if fullName.isEmpty {
            showError(textField: fullNameTextField, content: "isFullName", errorLabel: errorFullNameLabel)
            hasError = true
        } else {
            hideError(textField: fullNameTextField, errorLabel: errorFullNameLabel)
        }

        if !isValidEmail(email) {
            showError(textField: emailTextField, content: "isEmail", errorLabel: errorEmailLabel)
            hasError = true
        } else {
            hideError(textField: emailTextField, errorLabel: errorEmailLabel)
        }

        if !isValidPassword(password) {
            showError(textField: passwordTextField, content: "isPassword", errorLabel: errorPasswordLabel)
            hasError = true
        } else {
            hideError(textField: passwordTextField, errorLabel: errorPasswordLabel)
        }

        if hasError { return }

        DispatchQueue.global(qos: .userInitiated).async {
            self.registerUser(fullName: fullName, email: email, password: password)
        }
    }
    
    func hideError(textField: UITextField, errorLabel: UILabel) {
        textField.layer.borderWidth = 0
        errorLabel.isHidden = true
    }

    func registerUser(fullName: String, email: String, password: String) {
        AuthManager.shared.registerUser(email: email, password: password) { success, error, userId in
            if success, let userId = userId {
                UserManager.shared.saveUserData(userId: userId, name: fullName, email: email) { success, error in
                    if success {
                        self.navigateToSignIn()
                    } else {
                        self.showAlert(message: error ?? "Đã có lỗi xảy ra")
                    }
                }
            } else {
                self.showAlert(message: error ?? "Đăng ký thất bại")
            }
        }
    }

    func navigateToSignIn() {
        let signInVC = SignInViewController()
        signInVC.modalTransitionStyle = .crossDissolve
        signInVC.modalPresentationStyle = .fullScreen
        self.present(signInVC, animated: true)
    }

    
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
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func isValidPassword(_ password: String) -> Bool {
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
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

