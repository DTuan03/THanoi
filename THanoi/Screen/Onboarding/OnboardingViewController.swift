//
//  OnboardingViewController.swift
//  THanoi
//
//  Created by Tuấn on 11/12/24.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var continueButton: UIButton!
    
    let width = UIScreen.main.bounds.size.width
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButton.setUpButton(title: "continueButton")
        pageControl.isEnabled = false
        addContentToScrollView()
    }
    
    @IBAction func continueAction(_ sender: Any) {
        var contentOffset = scrollView.contentOffset
        
        if contentOffset.x <= scrollView.frame.size.width {
            contentOffset.x = contentOffset.x + width
            
            pageControl.currentPage += 1
            
            scrollView.setContentOffset(CGPoint(x: contentOffset.x, y: 0), animated: true)
        } else {
            let signUpVC = SignUpViewController()
            signUpVC.modalTransitionStyle = .crossDissolve
            signUpVC.modalPresentationStyle = .fullScreen
            present(signUpVC, animated: true, completion: nil)
        }
    }
    var onboardingModel: [OnboardingModel] = [
        OnboardingModel(title: NSLocalizedString("titleContinueOnboarding1", comment: ""), highLight: NSLocalizedString("highLineTitleContinueOnboarding1", comment: ""), description: NSLocalizedString("descriptionLabel1", comment: ""), image: "onboarding1", numberPageControl: 0),
        OnboardingModel(title: NSLocalizedString("titleContinueOnboarding2", comment: ""), highLight: NSLocalizedString("highLineTitleContinueOnboarding2", comment: ""), description: NSLocalizedString("descriptionLabel2", comment: ""), image: "onboarding2", numberPageControl: 1),
        OnboardingModel(title: NSLocalizedString("titleContinueOnboarding3", comment: ""), highLight: NSLocalizedString("highLineTitleContinueOnboarding3", comment: ""), description: NSLocalizedString("descriptionLabel3", comment: ""), image: "onboarding3", numberPageControl: 2)
    ]
    
    func addContentToScrollView() {
        scrollView.frame.size.width = width
        scrollView.contentSize = CGSize(width: scrollView.frame.width * 3, height: scrollView.frame.height)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.isPagingEnabled = false
        scrollView.isScrollEnabled = false
        
        for (index, onboarding) in onboardingModel.enumerated() {
            let contentView = UIView()
            contentView.translatesAutoresizingMaskIntoConstraints = false
            scrollView.addSubview(contentView)
            
            NSLayoutConstraint.activate([
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: scrollView.frame.width * CGFloat(index)),
                contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
            ])
            
            let image = UIImageView()
            image.translatesAutoresizingMaskIntoConstraints = false
            image.image = UIImage(named: onboarding.image)
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            contentView.addSubview(image)
            
            NSLayoutConstraint.activate([
                image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
                image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                image.topAnchor.constraint(equalTo: contentView.topAnchor),
                image.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.6)
            ])
            
            let title = UILabel()
            title.translatesAutoresizingMaskIntoConstraints = false
            title.text = onboarding.title
            title.numberOfLines = 0
            title.font = UIFont.boldSystemFont(ofSize: 28)
            title.textAlignment = .center
            let highlLightTitle = NSAttributedString().highLightText(fullText: onboarding.title, highLighText: onboarding.highLight, highLightColor: .color)
            title.attributedText = highlLightTitle

            
            contentView.addSubview(title)
            NSLayoutConstraint.activate([
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                title.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 30),
            ])
            
            let description = UILabel()
            description.translatesAutoresizingMaskIntoConstraints = false
            description.text = onboarding.description
            description.numberOfLines = 0
            description.font = UIFont.boldSystemFont(ofSize: 17)
            description.textColor = UIColor.gray
            description.textAlignment = .center
            contentView.addSubview(description)
            
            NSLayoutConstraint.activate([
                description.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                description.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                description.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            ])
        }
    }

}
