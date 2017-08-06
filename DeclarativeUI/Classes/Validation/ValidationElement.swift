//
//  ValidationElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

public extension ContentElement {
    
    static func validation(for element: ContentElement, with rules: [ValidationRule]) -> ContentElement {
        return ContentElement {
            return (UIView(), .none)
        }
    }
    
}
