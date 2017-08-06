//
//  ContentElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

public typealias AnyContentElement = ContentElement<Void>

public struct ContentElement<T> {
    
    public typealias Disposable = Any
    
    private let _render: (T) -> (UIView, [Disposable])
    
    internal init(render: @escaping () -> (UIView, [Disposable])) {
        self._render = { _ in render() }
    }
    
    internal init(render: @escaping (T) -> (UIView, [Disposable])) {
        self._render = render
    }
    
    public func render(_ viewModel: T) -> (UIView, [Disposable]) {
        return _render(viewModel)
    }
    
}
