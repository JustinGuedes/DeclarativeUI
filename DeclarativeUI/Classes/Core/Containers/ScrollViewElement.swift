//
//  ScrollViewElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

public extension ContentElement {
    
    static func scrollView(containing element: ContentElement) -> ContentElement {
        return ContentElement { (arg: T?) in
            let scrollView = UIScrollView()
            let (view, disposables) = element.render(arg)
            scrollView.addSubview(view)
            return (scrollView, disposables)
        }
    }
    
}
