//
//  Table1.swift
//  TableViewLab
//
//  Created by Muzahidul Islam on 14/9/19.
//  Copyright © 2019 Muzahidul Islam. All rights reserved.
//

import UIKit

class Table3: UITableViewController {
    
    var dataSource: GenericArrayDataSource<MyCell, String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = GenericArrayDataSource<MyCell,String>([])
        dataSource?.connect(to: tableView)
        dataSource?.items = (0...50).map{ "Row \($0)" }
    }
    
}
