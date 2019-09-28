//
//  CellConfigurable.swift
//  TableViewLab
//
//  Created by Muzahidul Islam on 12/9/19.
//  Copyright © 2019 Muzahidul Islam. All rights reserved.
//

import UIKit


protocol Configurable {
    associatedtype DataType
    func configure(_ data: DataType)
}

protocol CellConfigurable {
    var reuseID: String { get }
    var cellClass: AnyClass { get }
    func configure(_ cell: UITableViewCell)
}


struct GenericCellConfigurator<Cell> where Cell: UITableViewCell, Cell: Configurable {
    let cellClass: AnyClass = Cell.self
    let reuseID: String = Cell.reusedID()
    let data: Cell.DataType
    
    func configure(_ cell: UITableViewCell) {
        if let c = cell as? Cell {
            c.configure(data)
        }
    }
}

struct GenericCellModelConfigurator<Cell, Model> where Cell: UITableViewCell {
    typealias ConfigureBlock = (Cell, Model) -> Void
    let cellClass: AnyClass = Cell.self
    let reuseID: String = Cell.reusedID()
    let configureBlock: ConfigureBlock?
    let data: Model
    
    init(_ data: Model, configureBlock: ConfigureBlock?) {
        self.data = data
        self.configureBlock = configureBlock
    }
    
    func configure(_ cell: UITableViewCell) {
        if let c = cell as? Cell {
            configureBlock?(c, data)
        }
    }
}

extension GenericCellConfigurator: CellConfigurable { }

extension GenericCellModelConfigurator: CellConfigurable {}
