//
//  ContentElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

/// Convenience for content element with any type
public typealias AnyContentElement = ContentElement<Any>

/// Core component that renders a view with disposables
public struct ContentElement<T> {
    
    /// Represents anything that can be disposed
    public typealias Disposable = Any
    
    /// Internal render function that gets executed later
    internal let _render: (T?) -> (UIView, [Disposable])
    
    /// Initialises content element with a function that
    /// takes no arguments.
    ///
    /// - Parameter render: render function without parameter.
    internal init(render: @escaping () -> (UIView, [Disposable])) {
        self._render = { _ in render() }
    }
    
    /// Initialises content element with a function that
    /// takes an optional argument.
    ///
    /// - Parameter render: render function with optional parameter.
    internal init(render: @escaping (T?) -> (UIView, [Disposable])) {
        self._render = render
    }
    
    /// Renders the view with disposables, if any.
    ///
    /// - Returns: The view with its disposables.
    public func render() -> (UIView, [Disposable]) {
        return _render(.none)
    }
    
    /// Renders the view with the optional argument,
    /// intended only for internal use.
    ///
    /// - Parameter arg: argument to be supplied to render element.
    /// - Returns: The view with its disposables.
    internal func render(_ arg: T?) -> (UIView, [Disposable]) {
        return _render(arg)
    }
    
}
