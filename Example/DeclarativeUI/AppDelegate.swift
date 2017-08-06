//
//  AppDelegate.swift
//  DeclarativeUI
//
//  Created by JustinGuedes on 08/03/2017.
//  Copyright (c) 2017 JustinGuedes. All rights reserved.
//

import UIKit
import DeclarativeUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    class ViewModel {
        
        var title: Property<String?>
        var buttonEnabled: Property<Bool>
        
        public func tappedLogin() {
            title.value = "Tapped Login"
            buttonEnabled.value = false
        }
        
        deinit {
            print("Deinit ViewModel")
        }
        
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        let viewModel = ViewModel()
//        let elements: [ContentElement] = [
//            .label(ofType: .title1, text: "Hello World!", alignment: .center, keyPath: \ViewModel.title),
//            .verticalSpace(20),
//            .label(ofType: .body, text: "This is the body text!", alignment: .justified),
//            .textField(withPlaceholder: "Username"),
//            .textField(withPlaceholder: "Password"),
//            .flexibleSpace,
//            .button(ofType: .primary, withTitle: "Login", events:
//                .onTap(viewModel.tappedLogin),
//                .onEnable(\ViewModel.buttonEnabled)),
//        ]
        
//        let viewController = UIViewController(viewModel: viewModel, elements: elements)
        
        window?.rootViewController = Navigator.shared.navigationController
        Navigator.shared.navigate(toViewController: Storyboard.main)
        return true
    }

}

