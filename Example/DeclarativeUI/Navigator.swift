//
//  Navigator.swift
//  DeclarativeUI_Example
//
//  Created by Justin Guedes on 2017/08/06.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DeclarativeUI

struct Navigator {
    
    static let shared: Navigator = Navigator()
    
    let navigationController: UINavigationController
    
    private init() {
        navigationController = UINavigationController()
        if #available(iOS 11.0, *) {
            navigationController.navigationBar.prefersLargeTitles = true
        } else {
            // Fallback on earlier versions
        }
    }
    
    func navigate<T>(toViewController view: () -> (T, ContentElement<T>)) {
        let (viewModel, element): (T, ContentElement<T>) = view()
        let viewController = ViewController(viewModel: viewModel, element: element)
        if #available(iOS 11.0, *) {
            viewController.navigationItem.largeTitleDisplayMode = .always
        } else {
            // Fallback on earlier versions
        }
        viewController.title = "Example"
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
