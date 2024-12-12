//
//  NSAttributedString.swift
//  THanoi
//
//  Created by Tuấn on 11/12/24.
//

import Foundation
import UIKit

extension NSAttributedString {
    func highLightText(fullText: String, highLighText: String, highLightColor: UIColor) -> NSMutableAttributedString {
        let mutableAttributedString =  NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: highLighText)
        mutableAttributedString.addAttribute(.foregroundColor, value: highLightColor, range: range)
        
        return mutableAttributedString
    }
}
