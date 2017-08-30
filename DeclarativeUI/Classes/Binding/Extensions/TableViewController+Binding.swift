//
//  TableViewController+Binding.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/30.
//

import Foundation

public extension UITableViewController {
    
    public convenience init<Item, Binder: BindableCell>(withStyle style: UITableViewStyle = .plain, items: [Item], transform: @escaping (Item, inout Binder) -> Void, forCell cell: ContentElement<Binder>) {
        self.init(style: style)
        view.backgroundColor = .white
        var tableView = self.tableView!
        let delegate = TableViewDelegate()
        let dataSource = BindableTableViewDataSource(items: items, transform: transform, cell: cell, tableView: &tableView)
        tableView.delegate = delegate
        tableView.dataSource = dataSource
        tableView.__disposables = [delegate, dataSource]
        tableView.reloadData()
    }
    
}
