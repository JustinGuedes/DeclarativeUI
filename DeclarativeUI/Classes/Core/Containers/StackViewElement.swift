//
//  StackViewElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

@available(iOS 9.0, *)
public extension ContentElement {
    
    static func stackView(on axis: UILayoutConstraintAxis = .vertical,
                          alignment: UIStackViewAlignment = .fill,
                          distribution: UIStackViewDistribution = .fill,
                          spacing: CGFloat = 0,
                          with elements: [ContentElement]) -> ContentElement {
        
        return ContentElement { (arg: T?) in
            let renders = elements.map { $0.render(arg) }
            let views = renders.flatMap { $0.0 }
            let disposables = renders.flatMap { $0.1 }
            let stackView = UIStackView(arrangedSubviews: views)
            stackView.axis = axis
            stackView.alignment = alignment
            stackView.distribution = distribution
            stackView.spacing = spacing
            return (stackView, disposables)
        }
    }
    
}

