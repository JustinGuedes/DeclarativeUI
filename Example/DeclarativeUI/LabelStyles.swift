//
//  LabelStyles.swift
//  DeclarativeUI_Example
//
//  Created by Justin Guedes on 2017/08/13.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import DeclarativeUI

extension Style where UIElement == UILabel {
    
    static var title: Style {
        return Style {
            let label = UILabel()
            label.font = .preferredFont(forTextStyle: .title1)
            return label
        }
    }
    
    static var body: Style {
        return Style {
            let label = UILabel()
            label.font = .preferredFont(forTextStyle: .body)
            return label
        }
    }
    
}
