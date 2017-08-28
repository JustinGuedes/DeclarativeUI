//
//  ButtonTargetAction.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/13.
//

internal class ButtonTargetAction {
    
    let action: () -> Void
    init(action: @escaping () -> Void) {
        self.action = action
    }
    
    @objc func buttonAction() {
        action()
    }
    
}
