//
//  ContentElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

public struct ContentElement {
    
    public typealias Disposable = Any
    
    internal let _render: (Any...) -> (UIView, Disposable?)
    
    internal init(render: @escaping () -> (UIView, Disposable?)) {
        self._render = { _ in render() }
    }
    
    public func render() -> (UIView, Disposable?) {
        return _render()
    }
    
}
