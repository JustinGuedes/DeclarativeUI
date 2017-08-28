//
//  TableViewController.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/27.
//

import Foundation

public extension UITableViewController {
    
    public convenience init<T, U>(withStyle style: UITableViewStyle = .plain, items: [U], forCell cellElement: @escaping (U) -> ContentElement<T>) {
        self.init(style: style)
        view.backgroundColor = .white
        let delegate = TableViewDelegate()
        let dataSource = TableViewDataSource(items: items, cellElement: cellElement)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.__disposables = [delegate, dataSource]
        tableView.reloadData()
    }
    
}
