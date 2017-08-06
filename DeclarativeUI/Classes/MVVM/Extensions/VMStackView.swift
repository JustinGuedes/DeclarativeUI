//
//  VMStackView.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

import UIKit

@available(iOS 9.0, *)
public extension UIStackView {
    
    convenience init(with viewModel: Any, elements: [ContentElement]) {
        let renders = elements.map { $0.render(viewModel) }
        let views = renders.map { $0.0 }
        let disposables = renders.map { $0.1 }
        self.init(arrangedSubviews: views)
        self.__disposables = disposables
    }
    
    convenience init(with viewModel: Any, elements: ContentElement...) {
        self.init(with: viewModel, elements: elements)
    }
    
}
