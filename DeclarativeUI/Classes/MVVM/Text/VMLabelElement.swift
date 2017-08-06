//
//  VMLabelElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/06.
//

public extension ContentElement {
    
    static func label<A>(ofType type: UIFontTextStyle, text: String, alignment: NSTextAlignment = .left, keyPath: WritableKeyPath<A, Property<String?>>) -> ContentElement {
        return ContentElement { (viewModel: Any) in
            let label = UILabel()
            let property = _Property<String?>(get: { label.text }, set: { newText in label.text = newText })
            label.font = .preferredFont(forTextStyle: type)
            label.text = text
            label.textAlignment = alignment
            var instance = viewModel as? A
            instance?[keyPath: keyPath] = property
            return (label, [])
        }
    }
    
}
