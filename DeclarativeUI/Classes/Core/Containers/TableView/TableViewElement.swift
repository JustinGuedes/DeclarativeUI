//
//  TableViewElement.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/07.
//

import UIKit

public extension ContentElement {
    
    static func tableView<U>(withStyle style: UITableViewStyle = .plain, items: [U], forCell cellElement: @escaping (U) -> ContentElement) -> ContentElement {
        return ContentElement {
            let tableView = UITableView(frame: .zero, style: style)
            let delegate = TableViewDelegate()
            let dataSource = TableViewDataSource(items: items, cellElement: cellElement)
            tableView.delegate = delegate
            tableView.dataSource = dataSource
            return (tableView, [delegate, dataSource])
        }
    }
    
}
