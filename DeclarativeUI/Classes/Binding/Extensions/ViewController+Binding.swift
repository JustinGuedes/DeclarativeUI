//
//  ViewController+Binding.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

import Foundation

@available(iOS 9.0, *)
public extension UIViewController {
    
    internal var __viewModel: Any? {
        get { return objc_getAssociatedObject(self, "__viewModel") as Any }
        set { objc_setAssociatedObject(self, "__viewModel", newValue, .OBJC_ASSOCIATION_ASSIGN) }
    }
    
    public convenience init<T>(viewModel: T, element: ContentElement<T>) {
        self.init(nibName: .none, bundle: .none)
        let (renderedView, disposables) = element.render(viewModel)
        __viewModel = viewModel
        view.backgroundColor = .white
        view.addSubview(renderedView)        
        renderedView.__disposables = disposables
        renderedView.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            renderedView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
            renderedView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            renderedView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            renderedView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        } else {
            renderedView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
            renderedView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
            renderedView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
            renderedView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        }
    }
    
    public convenience init<T: Initializable>(element: ContentElement<T>) {
        self.init(viewModel: T.init(), element: element)
    }
    
}
