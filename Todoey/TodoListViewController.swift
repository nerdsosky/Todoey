//
//  ViewController.swift
//  Todoey
//
//  Created by Joseph Wysosky on 10/29/19.
//  Copyright © 2019 WillowTree App. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    let itemArray = ["Dogs", "Cats", "Iguanas"]

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    //MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        cell.selectionStyle = .gray
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCell.AccessoryType.none {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }

        tableView.deselectRow(at: indexPath, animated: true)
    }


}

