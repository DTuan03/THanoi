//
//  onboardingModel.swift
//  THanoi
//
//  Created by Tuấn on 11/12/24.
//

struct OnboardingModel {
    var title: String
    var highLight: String
    var description: String
    var image: String
    var numberPageControl: Int
    
    init(title: String, highLight: String, description: String, image: String, numberPageControl: Int) {
        self.title = title
        self.highLight = highLight
        self.description = description
        self.image = image
        self.numberPageControl = numberPageControl
    }
}
