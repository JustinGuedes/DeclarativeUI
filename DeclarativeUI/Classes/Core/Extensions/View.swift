//
//  View.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

extension UIView {
    
    var __disposables: [Any?]? {
        get { return objc_getAssociatedObject(self, "__disposable") as? [Any?] }
        set { objc_setAssociatedObject(self, "__disposable", newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC) }
    }
    
}
