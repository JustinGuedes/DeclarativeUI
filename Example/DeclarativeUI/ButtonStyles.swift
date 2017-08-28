//
//  ButtonStyles.swift
//  DeclarativeUI_Example
//
//  Created by Justin Guedes on 2017/08/13.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import DeclarativeUI

extension Style where UIElement == UIButton {
    
    static var primary: Style {
        return Style {
            let button = UIButton(type: .system)
            button.layer.cornerRadius = 3
            button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            button.backgroundColor = .gray
            button.setTitleColor(.white, for: .normal)
            return button
        }
    }
    
    static var secondary: Style {
        return Style {
            let button = UIButton(type: .system)
            button.layer.cornerRadius = 3
            button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.layer.borderWidth = 1.5
            button.setTitleColor(.darkGray, for: .normal)
            return button
        }
    }
    
}
