//
//  MainViewModel.swift
//  DeclarativeUI_Example
//
//  Created by Justin Guedes on 2017/08/06.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

class MainViewModel {
    
    func proceed() {
        Navigator.shared.navigate(toViewController: Storyboard.demo)
    }
    
}
