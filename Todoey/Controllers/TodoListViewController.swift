//
//  ViewController.swift
//  Todoey
//
//  Created by Joseph Wysosky on 10/29/19.
//  Copyright © 2019 WillowTree App. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = [TodoListItem]()
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        itemArray = defaults.array(forKey: "TodoListArray") as? [TodoListItem] ?? []
    }

    //MARK: - TableView Datasource Methods

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]

        cell.textLabel?.text = item.itemName
        cell.selectionStyle = .gray
        cell.accessoryType = item.isDone ? .checkmark : .none

        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }

    //MARK: - TableView Delegate Methods
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        itemArray[indexPath.row].isDone = !itemArray[indexPath.row].isDone
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //MARK: - Add New Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {

        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in

            let newItem = TodoListItem(name: textField.text!)
            self.itemArray.append(newItem)
            self.defaults.set(self.itemArray, forKey: "TodoListArray")
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

