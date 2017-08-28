//
//  ContentElement+Binding.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

public extension ContentElement {
    
    internal init(render: @escaping (T) -> (UIView, [Disposable])) {
        self._render = { arg in
            guard let arg = arg else { fatalError("Arg does not exist") }
            return render(arg)
        }
    }
    
    public func render(_ viewModel: T) -> (UIView, [Disposable]) {
        return _render(viewModel)
    }
    
}
