//
//  ViewController.swift
//  TableViewLab
//
//  Created by Muzahidul Islam on 12/9/19.
//  Copyright © 2019 Muzahidul Islam. All rights reserved.
//

import UIKit


class TypeList: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

}

class MyCell: UITableViewCell, Configurable {
    typealias DataType = String
    func configure(_ data: String) {
        textLabel?.text = data
    }
}
