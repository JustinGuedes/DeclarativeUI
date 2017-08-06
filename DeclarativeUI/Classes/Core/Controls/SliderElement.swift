//
//  SliderElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

public extension ContentElement {
    
    static func slider() -> ContentElement {
        return ContentElement {
            return (UIView(), [])
        }
    }
    
}
