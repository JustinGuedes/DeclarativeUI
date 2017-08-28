//
//  StackView+Binding.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

import UIKit

@available(iOS 9.0, *)
public extension UIStackView {
    
    convenience init<T>(with viewModel: T, elements: [ContentElement<T>]) {
        let renders = elements.map { $0.render(viewModel) }
        let views = renders.map { $0.0 }
        let disposables = renders.map { $0.1 }
        self.init(arrangedSubviews: views)
        self.__disposables = disposables
    }
    
    convenience init<T: AnyObject>(with viewModel: T, elements: ContentElement<T>...) {
        self.init(with: viewModel, elements: elements)
    }
    
}
