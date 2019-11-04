//
//  ViewController.swift
//  Todoey
//
//  Created by Joseph Wysosky on 10/29/19.
//  Copyright © 2019 WillowTree App. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Dogs", "Cats", "Iguanas"]

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

    //MARK: - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            self.itemArray.append(textField.text!)
            self.tableView.reloadData()
        }

        alert.addTextField { (alertTextfield) in
            alertTextfield.placeholder = "Enter Item Here"
            textField = alertTextfield
        }

        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

