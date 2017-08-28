//
//  TableViewDataSource.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/26.
//

class TableViewDataSource<T, U>: NSObject, UITableViewDataSource {
    
    let items: [T]
    let cellElement: (T) -> ContentElement<U>
    
    init(items: [T], cellElement: @escaping (T) -> ContentElement<U>) {
        self.items = items
        self.cellElement = cellElement
        super.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        let (view, disposables) = cellElement(items[indexPath.row]).render()
        cell.__disposables = disposables
        cell.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        return cell
    }

}
