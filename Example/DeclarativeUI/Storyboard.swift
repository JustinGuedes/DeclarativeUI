//
//  Storyboard.swift
//  DeclarativeUI_Example
//
//  Created by Justin Guedes on 2017/08/06.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import DeclarativeUI

struct Storyboard {
    
    static let main: () -> (MainViewModel, ContentElement<MainViewModel>) = {
        let viewModel = MainViewModel()
        return (viewModel, .stackView(with: [
            .label(ofStyle: .title, text: "Welcome to Declarative UI", alignment: .center),
            .flexibleSpace,
            .button(ofStyle: .primary, withTitle: "Proceed to Next Screen", events: .onTap(MainViewModel.proceed))
        ]))
    }
    
    static let demo: () -> (DemoViewModel, ContentElement<DemoViewModel>) = {
        let viewModel = DemoViewModel()
        return (viewModel, .stackView(spacing: 8, with: [
            .label(ofStyle: .title, text: "Demoing UI", alignment: .center),
            .verticalSpace(16),
            .label(ofStyle: .body, text: "This is the demo screen to demonstrate the different stuff from DUI. Feel free to click any button below to preview the specific UI element using the new DUI framework", alignment: .justified),
            .button(ofStyle: .primary, withTitle: "Tables", events: .onTap(DemoViewModel.tablesButtonTapped)),
            .flexibleSpace
        ]))
    }
    
    static func basicTable(items: [String]) -> () -> (BasicTableViewModel, ContentElement<BasicTableViewModel>) {
        return {
            let viewModel = BasicTableViewModel()
            return (viewModel, ContentElement<BasicTableViewModel>.tableView(withStyle: .plain, items: items, forCell: { (item: String) in
                return .label(ofStyle: .title, text: item, alignment: .center)
            }))
        }
    }
    
}
