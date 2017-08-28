//
//  LabelElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

public extension ContentElement {
    
    static func label(ofStyle style: Style<UILabel>, text: String, alignment: NSTextAlignment = .left) -> ContentElement {
        return ContentElement {
            let label = style.create()
            label.text = text
            label.textAlignment = alignment
            label.numberOfLines = 0
            return (label, [])
        }
    }
    
}
