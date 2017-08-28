//
//  ButtonEvent.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/13.
//

import Foundation

public enum ButtonEvent<T> {
    
    case onTap((T) -> () -> Void)
    case onEnable(WritableKeyPath<T, Property<Bool>>)
    
    internal func disposable(from viewModel: T, for button: UIButton) -> ContentElement<T>.Disposable? {
        var instance = viewModel
        switch self {
        case let .onTap(event):
            let action = ButtonTargetAction(action: event(viewModel))
            button.addTarget(action, action: #selector(ButtonTargetAction.buttonAction), for: .touchUpInside)
            return action
        case let .onEnable(keyPath):
            let property = _Property(get: { return button.isEnabled }, set: { newValue in button.isEnabled = newValue })
            instance[keyPath: keyPath] = property
        }
        
        return .none
    }
}
