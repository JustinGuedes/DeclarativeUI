//
//  DemoViewModel.swift
//  DeclarativeUI_Example
//
//  Created by Justin Guedes on 2017/08/06.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit
import DeclarativeUI

class DemoViewModel {
    
    func tablesButtonTapped() {
        let tableViewController = UITableViewController(withStyle: .plain, items: ["example1", "example2", "example3"], forCell: { (item: String) in
            return AnyContentElement.label(ofStyle: .title, text: item, alignment: .center)
        })
        tableViewController.title = "Test"
        if #available(iOS 11.0, *) {
            tableViewController.navigationItem.largeTitleDisplayMode = .always
        } else {
            // Fallback on earlier versions
        }
        Navigator.shared.navigationController.pushViewController(tableViewController, animated: true)
//        Navigator.shared.navigate(toViewController: Storyboard.basicTable(items: ))
    }
    
}
