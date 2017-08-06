//
//  StepperElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

public extension ContentElement {
    
    static func stepper() -> ContentElement {
        return ContentElement {
            return (UIView(), [])
        }
    }
    
}
