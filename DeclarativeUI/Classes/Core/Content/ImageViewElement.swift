//
//  ImageViewElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/04.
//

import UIKit

public extension ContentElement {
    
    static func image(named image: String) -> ContentElement {
        return ContentElement {
            let image = UIImage(named: image)
            let imageView = UIImageView(image: image)
            return (imageView, [])
        }
    }
    
    static func image(_ image: UIImage?, highlightedImage: UIImage?) -> ContentElement {
        return ContentElement {
            let imageView = UIImageView(image: image, highlightedImage: highlightedImage)
            return (imageView, [])
        }
    }
    
}
