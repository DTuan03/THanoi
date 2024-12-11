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
        titleLabel.text = NSLocalizedString("titleGetStartedOnboarding", comment: "")
        startButton.setTitle(NSLocalizedString("startButton", comment: ""), for: .normal)
        signInLabel.text = NSLocalizedString("signInLabel", comment: "")
        
        startButton.tintColor = UIColor.color
        
        let highLightSignIn = NSAttributedString().highLight(text: NSLocalizedString("signInLabel", comment: ""), highLighText: NSLocalizedString("highLineSignInLabel", comment: ""), highLightColor: .color)
        signInLabel.attributedText = highLightSignIn
        
    }

}
