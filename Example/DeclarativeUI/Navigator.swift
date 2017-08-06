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
    }
    
    func navigate(toViewController view: () -> (Any, [ContentElement])) {
        let (viewModel, elements) = view()
        let viewController = ViewController(viewModel: viewModel, elements: elements)
        navigationController.pushViewController(viewController, animated: true)
    }
    
}
