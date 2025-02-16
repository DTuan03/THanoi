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
        checkOnboarding()
        skipButton.setTitle(NSLocalizedString("skipButton", comment: ""), for: .normal)
        
        titleLabel.text = NSLocalizedString("titleGetStartedOnboarding", comment: "")
        startButton.setUpButton(title: "startButton")
        signInLabel.text = NSLocalizedString("signInLabel", comment: "")
                
        let highLightSignIn = NSAttributedString().highLightText(fullText: NSLocalizedString("signInLabel", comment: ""), highLighText: NSLocalizedString("highLineSignInLabel", comment: ""), highLightColor: .color)
        signInLabel.attributedText = highLightSignIn
        
        let signInTapGesture = UITapGestureRecognizer(target: self, action: #selector(signIn))
        signInLabel.addGestureRecognizer(signInTapGesture)
    }
    
    @objc func signIn() {
        let signInVC = SignInViewController()
        signInVC.modalTransitionStyle = .crossDissolve
        signInVC.modalPresentationStyle = .fullScreen
        present(signInVC, animated: true)
    }
    
    @IBAction func skipAction(_ sender: Any) {
        let signUpVC = SignUpViewController()
        signUpVC.modalTransitionStyle = .crossDissolve
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }
    
    
    @IBAction func getStartedAction(_ sender: Any) {
        let oVC = OnboardingViewController()
        oVC.modalPresentationStyle = .fullScreen
        oVC.modalTransitionStyle = .crossDissolve
        present(oVC, animated: true, completion: nil)
    }
    
    func checkOnboarding() {
        let defaults = UserDefaults.standard
        defaults.set(true, forKey: "isOnboarding")
    }
    
}
