//
//  VMViewController.swift
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
    
    public convenience init(viewModel: Any, elements: [ContentElement]) {
        self.init(nibName: .none, bundle: .none)
        view.backgroundColor = .white
        self.__viewModel = viewModel
        let stackView = UIStackView(with: viewModel, elements: elements)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 8
        view.addSubview(stackView)
        if #available(iOS 11.0, *) {
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        } else {
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8).isActive = true
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8).isActive = true
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8).isActive = true
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8).isActive = true
        }
    }
    
}
