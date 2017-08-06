//
//  LabelElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

public extension ContentElement {
    
    static func label(ofType type: UIFontTextStyle, text: String, alignment: NSTextAlignment = .left) -> ContentElement {
        return ContentElement {
            let label = UILabel()
            label.font = .preferredFont(forTextStyle: type)
            label.text = text
            label.textAlignment = alignment
            return (label, .none)
        }
    }
    
}
