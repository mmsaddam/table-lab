//
//  DataSource.swift
//  TableViewLab
//
//  Created by Muzahidul Islam on 12/9/19.
//  Copyright © 2019 Muzahidul Islam. All rights reserved.
//

import UIKit

class ArrayDataSource: NSObject, UITableViewDataSource {
    
    let items: [CellConfigurable]
    
    init(_ items: [CellConfigurable]) {
        self.items = items
    }
    
    func itemAt(_ indexPath: IndexPath) -> CellConfigurable? {
        if items.indices.contains(indexPath.row) {
            return items[indexPath.row]
        }
        return nil
    }
    
    func registerCells(to tableView: UITableView) {
        for configurator in items {
            tableView.register(configurator.cellClass, forCellReuseIdentifier: configurator.reuseID)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let configurator = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: configurator.reuseID, for: indexPath)
        configurator.configure(cell)
        return cell
    }
    
}

class GenericArrayDataSource<Cell: Configurable, Model>: NSObject, UITableViewDataSource where Cell: UITableViewCell, Cell.DataType == Model {
    
    weak var tableView: UITableView?
    
    var items: [Model] = [] {
        didSet {
            tableView?.reloadData()
        }
    }
    
    init(_ items: [Model]) {
        self.items = items
    }
    
    func connect(to tableView: UITableView) {
        if let prevTableView = self.tableView,
            prevTableView.dataSource === self {
            prevTableView.dataSource = nil
        }
        
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.reusedID())
        tableView.dataSource = self
        self.tableView = tableView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: Cell = tableView.dequeCell(Cell.self, for: indexPath)
        let model = items[indexPath.row]
        cell.configure(model)
        return cell
    }
    
}
