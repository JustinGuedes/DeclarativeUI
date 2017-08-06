//
//  SpaceElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

import UIKit

@available(iOS 9.0, *)
public extension ContentElement {
    
    static func verticalSpace(_ constant: CGFloat) -> ContentElement {
        return ContentElement {
            let space = UIView()
            space.translatesAutoresizingMaskIntoConstraints = false
            space.heightAnchor.constraint(equalToConstant: constant).isActive = true
            return (space, .none)
        }
    }
    
    static func horizontalSpace(_ constant: CGFloat) -> ContentElement {
        return ContentElement {
            let space = UIView()
            space.translatesAutoresizingMaskIntoConstraints = false
            space.widthAnchor.constraint(equalToConstant: constant).isActive = true
            return (space, .none)
        }
    }
    
}
