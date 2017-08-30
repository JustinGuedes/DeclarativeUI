//
//  BindableTableViewDataSource.swift
//  DeclarativeUI
//
//  Created by Justin Guedes on 2017/08/29.
//

class BindableTableViewDataSource<Binder: BindableCell, Item>: NSObject, UITableViewDataSource {
    
    private let cellReuseIdentifier = "root"
    
    let items: [Item]
    let transform: (Item, inout Binder) -> Void
    let cell: ContentElement<Binder>
    var binders: [UITableViewCell: Binder]
    
    init(items: [Item], transform: @escaping (Item, inout Binder) -> Void, cell: ContentElement<Binder>, tableView: inout UITableView) {
        self.items = items
        self.transform = transform
        self.cell = cell
        self.binders = [:]
        super.init()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
            fatalError("Cell not found, impossibru!")
        }
        
        var binder = binders[cell] ?? createBinder(forCell: cell)
        let item = items[indexPath.row]
        transform(item, &binder)
        return cell
    }
    
    func createBinder(forCell cell: UITableViewCell) -> Binder {
        let binder = Binder.init()
        let (view, disposables) = self.cell.render(binder)
        cell.__disposables = disposables
        cell.addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.topAnchor.constraint(equalTo: cell.topAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: cell.leadingAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: cell.bottomAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: cell.trailingAnchor).isActive = true
        binders[cell] = binder
        return binder
    }
    
}
