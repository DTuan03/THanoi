//
//  NSAttributedString.swift
//  THanoi
//
//  Created by Tuấn on 11/12/24.
//

import Foundation
import UIKit

extension NSAttributedString {
    func highLight(text: String, highLighText: String, highLightColor: UIColor) -> NSMutableAttributedString {
        let mutableAttributedString =  NSMutableAttributedString(string: text)
        let range = (text as NSString).range(of: highLighText)
        mutableAttributedString.addAttribute(.foregroundColor, value: highLightColor, range: range)
        
        return mutableAttributedString
    }
}
