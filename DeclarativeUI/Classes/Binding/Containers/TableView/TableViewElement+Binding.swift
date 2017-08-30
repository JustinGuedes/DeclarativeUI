//
//  TableViewElement+Binding.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/29.
//

public extension ContentElement {

    static func tableView<Item, Binder: BindableCell>(withStyle style: UITableViewStyle = .plain, items: [Item], transform: @escaping (Item, inout Binder) -> Void, forCell cell: ContentElement<Binder>) -> ContentElement {
        return ContentElement {
            var tableView = UITableView(frame: .zero, style: style)
            let delegate = TableViewDelegate()
            let dataSource = BindableTableViewDataSource(items: items, transform: transform, cell: cell, tableView: &tableView)
            tableView.delegate = delegate
            tableView.dataSource = dataSource
            return (tableView, [delegate, dataSource])
        }
    }
    
}
