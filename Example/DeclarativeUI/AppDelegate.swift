//
//  AppDelegate.swift
//  DeclarativeUI
//
//  Created by JustinGuedes on 08/03/2017.
//  Copyright (c) 2017 JustinGuedes. All rights reserved.
//

import UIKit
import DeclarativeUI

protocol TestViewModel {
    
    var title: Property<String?> { get set }
    var buttonEnabled: Property<Bool> { get set }
    
    func tappedLogin()
    
}

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
        let viewModel = ViewModel()
        let element: ContentElement<ViewModel> = .stackView(with: [
            .label(ofStyle: .title, text: "Hello World!", alignment: .center, keyPath: \ViewModel.title),
            .verticalSpace(20),
            .label(ofStyle: .body, text: "This is the body text!", alignment: .justified),
            .textField(withPlaceholder: "Username"),
            .textField(withPlaceholder: "Password"),
            .flexibleSpace,
            .button(ofStyle: .primary, withTitle: "Login", events:
                .onTap(ViewModel.tappedLogin),
                .onEnable(\ViewModel.buttonEnabled)),
        ])
        
        let viewController = UIViewController(viewModel: viewModel, element: element)
        
        window?.rootViewController = Navigator.shared.navigationController
        Navigator.shared.navigate(toViewController: Storyboard.main)
        return true
    }

}

