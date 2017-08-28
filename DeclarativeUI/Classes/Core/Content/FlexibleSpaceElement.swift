//
//  FlexibleSpaceElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

import UIKit

public extension ContentElement {
    
    static var flexibleSpace: ContentElement {
        return ContentElement {
            let space = UIView()
            space.setContentHuggingPriority(UILayoutPriority(0), for: .vertical)
            space.setContentHuggingPriority(UILayoutPriority(0), for: .horizontal)
            return (space, [])
        }
    }
    
}
