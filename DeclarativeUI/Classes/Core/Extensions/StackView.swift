//
//  StackView.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

@available(iOS 9.0, *)
public extension UIStackView {
    
    convenience init<T>(elements: [ContentElement<T>]) {
        let renders = elements.map { $0.render() }
        let views = renders.flatMap { $0.0 }
        let disposables = renders.flatMap { $0.1 }
        self.init(arrangedSubviews: views)
        self.__disposables = disposables
    }
    
    convenience init<T>(elements: ContentElement<T>...) {
        self.init(elements: elements)
    }
    
}
