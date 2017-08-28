//
//  ButtonStyle.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/13.
//

import UIKit

public struct ButtonStyle {
    
    let createButton: () -> UIButton
    
    public init(createButton: @escaping () -> UIButton) {
        self.createButton = createButton
    }
    
}
