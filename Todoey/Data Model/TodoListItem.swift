//
//  TodoListItem.swift
//  Todoey
//
//  Created by Joseph Wysosky on 11/6/19.
//  Copyright © 2019 WillowTree App. All rights reserved.
//

import Foundation

class TodoListItem {

    var itemName: String
    var isDone: Bool

    init(name: String) {
        itemName = name
        isDone = false
    }

}
