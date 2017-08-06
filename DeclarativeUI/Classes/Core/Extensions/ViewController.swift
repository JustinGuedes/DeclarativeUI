//
//  ViewController.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import Foundation

@available(iOS 9.0, *)
public extension UIViewController {
    
    public convenience init(elements: [ContentElement]) {
        self.init(nibName: .none, bundle: .none)
        view.backgroundColor = .white
        let stackView = UIStackView(elements: elements)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
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
