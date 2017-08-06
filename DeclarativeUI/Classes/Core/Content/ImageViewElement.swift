//
//  ImageViewElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

public extension ContentElement {
    
    static func image() -> ContentElement {
        return ContentElement {
            return (UIView(), .none)
        }
    }
    
}
