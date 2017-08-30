//
//  TodoList.swift
//  iToDo
//
//  Created by Tomek Buslowski on 30.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import UIKit

class TodoList: NSObject {
    
    let cellIdentifier = "Cell"
    
    private let fileURL: NSURL = {
        let documentDirectoryURLs = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectoryURL = documentDirectoryURLs.first!
        return documentDirectoryURL.appendingPathComponent("todolist.items") as NSURL
    }()
    
    var items: [String] = []
    var itemsCount: Int {
        get {
            return items.count
        }
    }
    
    override init() {
        super.init()
        loadItems()
    }
    
    func saveItems() {
        let itemsArray = items as NSArray
        
        print("Saving items in \(fileURL)")
        if !itemsArray.write(to: fileURL as URL, atomically: true) {
            print("Error, cannot save items from todo list")
        }
    }
    
    func loadItems() {
        if let itemsArray = NSArray(contentsOf: fileURL as URL) as? [String] {
            items = itemsArray
        }
    }
    
    func removeItem(index: Int) {
        guard index < items.count, index >= 0 else {
            print("Element with index: \(index) doesn't exist.")
            return
        }
        items.remove(at: index)
        saveItems()
    }
    
    func addItem(item: String) {
        items.append(item)
        saveItems()
    }
}

extension TodoList: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let item = items[indexPath.row]
        
        cell.textLabel!.text = item
        
        return cell
    }
}
