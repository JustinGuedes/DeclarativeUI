//
//  TextFieldElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

public extension ContentElement {
    
    static func textField(withPlaceholder placeholder: String) -> ContentElement {
        return ContentElement {
            let textField = UITextField()
            textField.borderStyle = .roundedRect
            textField.placeholder = placeholder
            return (textField, [])
        }
    }
    
}
