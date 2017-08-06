//
//  VMContentElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

public extension ContentElement {
    
    internal init(render: @escaping (Any) -> (UIView, [Disposable])) {
        self._render = { (args: Any...) in render(args[0]) }
    }
    
    public func render(_ viewModel: Any) -> (UIView, [Disposable]) {
        return _render(viewModel)
    }
    
}
