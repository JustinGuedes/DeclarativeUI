//
//  StackViewElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

@available(iOS 9.0, *)
public extension ContentElement {
    
    static func stackView(on axis: UILayoutConstraintAxis = .vertical, alignment: UIStackViewAlignment = .fill, distribution: UIStackViewDistribution = .fillProportionally, with elements: [ContentElement<T>]) -> ContentElement {
        return ContentElement { (viewModel: T) in
            let stackView = UIStackView(with: viewModel, elements: elements)
            stackView.axis = axis
            stackView.alignment = alignment
            stackView.distribution = distribution
            return (stackView, [])
        }
    }
    
}
