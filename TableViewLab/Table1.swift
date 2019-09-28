//
//  Table1.swift
//  TableViewLab
//
//  Created by Muzahidul Islam on 14/9/19.
//  Copyright © 2019 Muzahidul Islam. All rights reserved.
//

import UIKit

class Table1: UITableViewController {
   
    var dataSource: ArrayDataSource?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let list = (0...50).map { return GenericCellConfigurator<MyCell>(data: "Row \($0)") }
        
        dataSource = ArrayDataSource(list)
        dataSource?.registerCells(to: tableView)
        tableView.dataSource = dataSource
        
    }
    
}
