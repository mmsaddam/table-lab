//
//  CellReuseable.swift
//  TableViewLab
//
//  Created by Muzahidul Islam on 12/9/19.
//  Copyright © 2019 Muzahidul Islam. All rights reserved.
//

import UIKit

protocol Reuseable: class {
    static func reusedID() -> String
}

extension Reuseable {
    static func reusedID() -> String {
        return String(describing: self)
    }
}

extension UITableViewCell: Reuseable {}

extension UITableView {
    
    func dequeCell<T: Reuseable>(_ type: T.Type) -> T? {
        return dequeueReusableCell(withIdentifier: T.reusedID()) as? T
    }
    
    func dequeCell<T: Reuseable>(_ type: T.Type, for indexPath: IndexPath) -> T {
        return dequeueReusableCell(withIdentifier: T.reusedID(), for: indexPath) as! T
    }
    
    func register<T: Reuseable>(_ type: T.Type) {
        register(type, forCellReuseIdentifier: T.reusedID())
    }
    
    func registerNib<T: Reuseable>(_ type: T.Type) {
        let nib = UINib(nibName: T.reusedID(), bundle: nil)
        register(nib, forCellReuseIdentifier: T.reusedID())
    }
}


