//
//  VMButtonElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

import UIKit

public extension ContentElement {
    
    enum ButtonEvent<A> {
        case onTap((A) -> () -> Void)
        case onEnable(WritableKeyPath<A, Property<Bool>>)
        
        internal func disposable(from viewModel: A, for button: UIButton) -> Disposable? {
            var instance = viewModel
            switch self {
            case let .onTap(event):
                let action = ButtonAction(onTap: event(viewModel))
                button.addTarget(action, action: #selector(ButtonAction.buttonTapped(_:)), for: .touchUpInside)
                return action
            case let .onEnable(keyPath):
                let property = _Property(get: { return button.isEnabled }, set: { newValue in button.isEnabled = newValue })
                instance[keyPath: keyPath] = property
            }
            
            return .none
        }
    }
    
    static func button<A>(ofType type: ButtonType, withTitle title: String, events: ButtonEvent<A>...) -> ContentElement {
        return ContentElement { (viewModel: Any) in
            let button = type.createButton()
            button.setTitle(title, for: .normal)
            let disposables: [Disposable] = events.flatMap { event in
                guard let instance = viewModel as? A,
                    let disposable = event.disposable(from: instance, for: button) else { return .none }
                return disposable
            }
            
            return (button, disposables)
        }
    }
    
}
