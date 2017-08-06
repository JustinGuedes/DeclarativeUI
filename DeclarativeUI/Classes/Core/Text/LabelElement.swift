//
//  LabelElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/03.
//

import UIKit

public extension ContentElement {
    
    static func label(ofType type: UIFontTextStyle, text: String, alignment: NSTextAlignment = .left) -> ContentElement {
        return ContentElement {
            let label = UILabel()
            label.font = .preferredFont(forTextStyle: type)
            label.text = text
            label.textAlignment = alignment
            return (label, [])
        }
    }
    
    static func label(ofType type: UIFontTextStyle, text: String, alignment: NSTextAlignment = .left, keyPath: WritableKeyPath<T, Property<String?>>) -> ContentElement {
        return ContentElement { (viewModel: T) in
            var viewModel = viewModel
            let label = UILabel()
            let property = _Property<String?>(get: { label.text }, set: { newText in label.text = newText })
            label.font = .preferredFont(forTextStyle: type)
            label.text = text
            label.textAlignment = alignment
            viewModel[keyPath: keyPath] = property
            return (label, [])
        }
    }
    
}
