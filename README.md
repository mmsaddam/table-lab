# table-lab

A declarative way to present list in table view.

## Behind the scene

As an iOS developer it's very common to populate list data into table view. That's why I try to develop a generic data source so that list can be easily shown. Here I have shown three ways in which anyone can easily present a list of data into table.

### How to use?
Create a custom cell and Confirm *Configurable* protocol. Then declare any of the following data source and connect to tableView.

  
```
class MyCell: UITableViewCell, Configurable {
    typealias DataType = String
    func configure(_ data: String) {
        textLabel?.text = data
    }
}
```
```First way
    var dataSource: ArrayDataSource?
    
    let list = (0...50).map { return GenericCellConfigurator<MyCell>(data: "Row \($0)") }
    dataSource = ArrayDataSource(list)
    dataSource?.registerCells(to: tableView)
    tableView.dataSource = dataSource
```
```Second way
    var dataSource: ArrayDataSource?
   
    let list = (0...50).map {
        return GenericCellModelConfigurator<MyCell, String>("Row \($0)", configureBlock: { cell, data in
            cell.configure(data)
        })
    }
    dataSource = ArrayDataSource(list)
    dataSource?.registerCells(to: tableView)
    tableView.dataSource = dataSource
```
```Third way
    var dataSource: GenericArrayDataSource<MyCell, String>?
   
    dataSource = GenericArrayDataSource<MyCell,String>([])
    dataSource?.connect(to: tableView)
    dataSource?.items = (0...50).map{ "Row \($0)" }
```

## Contributing
Any idea or suggestions are welcomed.
