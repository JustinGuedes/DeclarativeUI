//
//  ButtonElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

public extension ContentElement {
    
    internal class ButtonAction {
        
        let onTap: () -> ()
        init (onTap: @escaping () -> ()) {
            self.onTap = onTap
        }
        
        @objc func buttonTapped(_ sender: AnyObject) {
            onTap()
        }
        
    }
    
    enum ButtonType {
        case primary
        case secondary
        
        func createButton() -> UIButton {
            let button = UIButton(type: .system)
            button.layer.cornerRadius = 3
            button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
            switch self {
            case .primary:
                button.backgroundColor = .gray
                button.setTitleColor(.white, for: .normal)
            case .secondary:
                button.layer.borderColor = UIColor.darkGray.cgColor
                button.layer.borderWidth = 1.5
                button.setTitleColor(.darkGray, for: .normal)
            }
            
            return button
        }
    }
    
    static func button(ofType type: ButtonType, withTitle title: String, onTap: @escaping () -> ()) -> ContentElement {
        return ContentElement {
            let action = ButtonAction(onTap: onTap)
            let button = type.createButton()
            button.setTitle(title, for: .normal)
            button.addTarget(action, action: #selector(ButtonAction.buttonTapped(_:)), for: .touchUpInside)
            return (button, action)
        }
    }
    
}
