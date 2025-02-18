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
        setupUI()
        let tapSignUp = UITapGestureRecognizer(target: self, action: #selector(signUpLabelAction))
        orSignUp.addGestureRecognizer(tapSignUp)
        addDismissKeyboard()
    }
    
    func setupUI() {
        titleLabel.text = NSLocalizedString("titleSignIn", comment: "")
        descriptionLabel.text = NSLocalizedString("descriptionSignIn", comment: "")
        
        emailTextField.imageLeftView(image: "envelope", placeholder: "email")
        passwordTextField.imageLeftView(image: "lock", placeholder: "passWord")
        passwordTextField.imageRightView(image: "eyebrow")
        
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
    }
    
    @objc func signUpLabelAction() {
        let signUpVC = SignUpViewController()
        signUpVC.modalTransitionStyle = .crossDissolve
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true)
    }
    
    @IBAction func signInAction(_ sender: Any) {
        if !isValidEmail(emailTextField.text) {
            showError(textField: emailTextField, content: "isEmail", errorLabel: errorEmailLabel, isError: true)
            return
        }

        if !isValidPassword(passwordTextField.text) {
            showError(textField: passwordTextField, content: "isPassword", errorLabel: errorPasswordLabel, isError: true)
            return
        }
        
        guard let email = emailTextField.text, !email.isEmpty else { return }
        guard let password = passwordTextField.text, !password.isEmpty else { return }

        emailTextField.layer.borderWidth = 0
        errorEmailLabel.isHidden = true
        passwordTextField.layer.borderWidth = 0
        errorPasswordLabel.isHidden = true
        
        DispatchQueue.global(qos: .userInitiated).async {
            AuthManager.shared.loginUser(email: email, password: password) { result, error, userId in
                DispatchQueue.main.async {
                    if result {
                        UserDefaults.standard.set(userId, forKey: "userId")
                        UserDefaults.standard.set(true, forKey: "isSignIn")
                        
                        let tabbarVC = TabBarViewController()
                        tabbarVC.modalTransitionStyle = .crossDissolve
                        tabbarVC.modalPresentationStyle = .fullScreen
                        self.present(tabbarVC, animated: true)
                    } else {
                        self.showAlert()
                    }
                }
            }
        }
    }
                                         
    func showAlert(message: String = "Kiểm tra lại tài khoản, mật khẩu") {
        let alert = UIAlertController(title: "Thông báo", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
    
    func showError(textField: UITextField, content: String, errorLabel: UILabel, isError: Bool) {
        if isError {
            textField.layer.borderWidth = 1.0
            textField.layer.borderColor = UIColor.red.cgColor
            errorLabel.text = NSLocalizedString(content, comment: "")
            errorLabel.isHidden = false
        } else {
            textField.layer.borderWidth = 0
            errorLabel.isHidden = true
        }
    }

    
    func isValidEmail(_ email: String?) -> Bool {
        guard let email = email else { return false }
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: email)
    }

    func isValidPassword(_ password: String?) -> Bool {
        guard let password = password else { return false }
        let passwordRegex = "^(?=.*[A-Z])(?=.*[0-9]).{8,}$"
        return NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password)
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
