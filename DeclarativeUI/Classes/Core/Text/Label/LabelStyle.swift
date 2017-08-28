//
//  LabelStyle.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/13.
//

import UIKit

public struct LabelStyle {
    
    let createLabel: () -> UILabel
    
    public init(createLabel: @escaping () -> UILabel) {
        self.createLabel = createLabel
    }
    
}

public struct Style<UIElement> {
    
    let create: () -> UIElement
    
    public init(create: @escaping () -> UIElement) {
        self.create = create
    }
    
}
