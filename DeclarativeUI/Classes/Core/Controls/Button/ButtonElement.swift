//
//  ButtonElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

public extension ContentElement {
    
    static func button(ofStyle style: Style<UIButton>, withTitle title: String, onTap: @escaping () -> ()) -> ContentElement {
        return ContentElement {
            let action = ButtonTargetAction(action: onTap)
            let button = style.create()
            button.setTitle(title, for: .normal)
            button.addTarget(action, action: #selector(ButtonTargetAction.buttonAction), for: .touchUpInside)
            return (button, [action])
        }
    }
    
}
