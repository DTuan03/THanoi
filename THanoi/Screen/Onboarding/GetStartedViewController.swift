//
//  GetStartedViewController.swift
//  THanoi
//
//  Created by Tuấn on 11/12/24.
//

import UIKit

class GetStartedViewController: UIViewController {
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var signInLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        skipButton.setTitle(NSLocalizedString("skipButton", comment: ""), for: .normal)
//        chevron.forward
        titleLabel.text = NSLocalizedString("titleGetStartedOnboarding", comment: "")
        startButton.setUpButton(title: "startButton")
        signInLabel.text = NSLocalizedString("signInLabel", comment: "")
                
        let highLightSignIn = NSAttributedString().highLightText(fullText: NSLocalizedString("signInLabel", comment: ""), highLighText: NSLocalizedString("highLineSignInLabel", comment: ""), highLightColor: .color)
        signInLabel.attributedText = highLightSignIn
        
        //Bật tương tác người dùng, có thể bật bên inspector
//        signInLabel.isUserInteractionEnabled = true
        let signInTapGesture = UITapGestureRecognizer(target: self, action: #selector(signIn))
        signInLabel.addGestureRecognizer(signInTapGesture)
    }
    
    @objc func signIn() {
        checkOnboarding()
        //TODO: Chuyen qua man hinh dang nhap
        print("Da chuyen qua man hinh dang nhap")
    }
    
    @IBAction func skipAction(_ sender: Any) {
        let signUpVC = SignUpViewController()
        signUpVC.modalTransitionStyle = .crossDissolve
        signUpVC.modalPresentationStyle = .fullScreen
        checkOnboarding()
        present(signUpVC, animated: true, completion: nil)
    }
    
    
    @IBAction func getStartedAction(_ sender: Any) {
        let oVC = OnboardingViewController()
        oVC.modalPresentationStyle = .fullScreen
        oVC.modalTransitionStyle = .crossDissolve
        checkOnboarding()
        present(oVC, animated: true, completion: nil)
    }
    
    func checkOnboarding() {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "isOnboarding")
    }
    
}
