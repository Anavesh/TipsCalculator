//
//  RobotoDynamicType.swift
//  TipsCalculator
//
//  Created by Naira on 13.01.2025.
//

import UIKit

struct Roboto {
    private enum Variant: String {
        case black = "Roboto-Black"
        case bold = "Roboto-Bold"
        case light = "Roboto-Light"
        case medium = "Roboto-Medium"
        case regular = "Roboto-Regular"
        case thin = "Roboto-Thin"
    }
    
    static func dynamicType(for textStyle: UIFont.TextStyle) -> UIFont {
        let fontName:String
        
        switch textStyle {
        case.largeTitle:
            fontName = Variant.black.rawValue
        case .title1:
            fontName = Variant.bold.rawValue
        case .title2:
            fontName = Variant.medium.rawValue
        case .title3, .headline:
            fontName = Variant.bold.rawValue
        case .subheadline:
            fontName = Variant.regular.rawValue
        case .body:
            fontName = Variant.regular.rawValue
        case .callout:
            fontName = Variant.regular.rawValue
        case .footnote:
            fontName = Variant.light.rawValue
        case .caption1:
            fontName = Variant.light.rawValue
        case .caption2:
            fontName = Variant.thin.rawValue
        default:
            fontName = Variant.regular.rawValue
        }
        
        guard let customFont = UIFont(name: fontName, size: UIFont.preferredFont(forTextStyle: textStyle).pointSize) else { fatalError("Font \(fontName) was not found. Check that it was added to info.plst")
        }
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: customFont)
    }
}
