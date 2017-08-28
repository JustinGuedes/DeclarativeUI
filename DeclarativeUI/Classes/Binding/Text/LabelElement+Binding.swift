//
//  LabelElement+Binding.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

public extension ContentElement {
    
    static func label(ofStyle style: Style<UILabel>, text: String, alignment: NSTextAlignment = .left, keyPath: WritableKeyPath<T, Property<String?>>) -> ContentElement {
        return ContentElement { (viewModel: T) in
            let label = style.create()
            let property = _Property<String?>(get: { label.text }, set: { newText in label.text = newText })
            label.text = text
            label.textAlignment = alignment
            var instance = viewModel
            instance[keyPath: keyPath] = property
            return (label, [])
        }
    }
    
}
