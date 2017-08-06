//
//  ButtonElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

public extension ContentElement {
    
    internal class ButtonAction {
        
        let onTap: () -> Void
        init(onTap: @escaping () -> Void) {
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
    
    enum ButtonEvent<A> {
        case onTap(() -> Void)
        case onEnable(WritableKeyPath<T, Property<Bool>>)
        
        internal func disposable(from viewModel: T, for button: UIButton) -> Disposable? {
            var instance = viewModel
            switch self {
            case let .onTap(event):
                let action = ButtonAction(onTap: event)
                button.addTarget(action, action: #selector(ButtonAction.buttonTapped(_:)), for: .touchUpInside)
                return action
            case let .onEnable(keyPath):
                let property = _Property(get: { return button.isEnabled }, set: { newValue in button.isEnabled = newValue })
                instance[keyPath: keyPath] = property
            }
            
            return .none
        }
    }
    
    static func button(ofType type: ButtonType, withTitle title: String, onTap: @escaping () -> ()) -> ContentElement {
        return ContentElement {
            let action = ButtonAction(onTap: onTap)
            let button = type.createButton()
            button.setTitle(title, for: .normal)
            button.addTarget(action, action: #selector(ButtonAction.buttonTapped(_:)), for: .touchUpInside)
            return (button, [action])
        }
    }
    
    static func button(ofType type: ButtonType, withTitle title: String, events: ButtonEvent<T>...) -> ContentElement {
        return ContentElement { (viewModel: T) in
            let button = type.createButton()
            button.setTitle(title, for: .normal)
            let disposables: [Disposable] = events.flatMap { event in
                guard let disposable = event.disposable(from: viewModel, for: button) else { return .none }
                return disposable
            }
            
            return (button, disposables)
        }
    }
    
}
