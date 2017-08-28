//
//  ButtonElement+Binding.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

import UIKit

public extension ContentElement {
    
    static func button(ofStyle style: Style<UIButton>, withTitle title: String, events: ButtonEvent<T>...) -> ContentElement {
        return ContentElement { (viewModel: T) in
            let button = style.create()
            button.setTitle(title, for: .normal)
            let disposables: [Disposable] = events.flatMap { event in
                return event.disposable(from: viewModel, for: button)
            }
            
            return (button, disposables)
        }
    }
    
}
