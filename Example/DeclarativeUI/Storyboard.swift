//
//  Storyboard.swift
//  DeclarativeUI_Example
//
//  Created by Justin Guedes on 2017/08/06.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import DeclarativeUI

struct Storyboard {
    
    static let main: () -> (MainViewModel, [ContentElement]) = {
        let viewModel = MainViewModel()
        return (viewModel, [
            .label(ofType: .title1, text: "Welcome to Declarative UI", alignment: .center),
            .flexibleSpace,
            .button(ofType: .primary, withTitle: "Proceed to Next Screen", events: .onTap(MainViewModel.proceed))
        ])
    }
    
    static let demo: () -> (DemoViewModel, [ContentElement]) = {
        let viewModel = DemoViewModel()
        return (viewModel, [
            .label(ofType: .title1, text: "Demoing UI", alignment: .center),
            .verticalSpace(16),
            .label(ofType: .body, text: "This is the demo screen to demonstrate the different stuff from DUI. Feel free to click any button below to preview the specific UI element using the new DUI framework", alignment: .justified),
            .button(ofType: .primary, withTitle: "Demo Labels", events: .onTap(DemoViewModel.demoLabelsTapped)),
            .button(ofType: .primary, withTitle: "Demo TextFields", events: .onTap(DemoViewModel.demoTextFieldsTapped)),
            .flexibleSpace
        ])
    }
    
}
