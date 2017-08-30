//
//  ViewController.swift
//  iToDo
//
//  Created by Tomek Buslowski on 29.08.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var itemsInfoLabel: UILabel!
    @IBOutlet weak var itemTextField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    let todoList = TodoList()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: todoList.cellIdentifier)
        tableView.dataSource = todoList
        itemsInfoLabel.text = "You have \(todoList.itemsCount) things"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func addButtonPressed(_ sender: UIButton) {
        guard let text = itemTextField.text, !text.isEmpty else {
            return
        }
        itemTextField.text = ""
        todoList.addItem(item: text)
        tableView.reloadData()
        itemsInfoLabel.text = "You have \(todoList.itemsCount) things"
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print("Sthng was tapped: \(indexPath.row), \(todoList.items[(indexPath.row)])")
        todoList.removeItem(index: indexPath.row)
        tableView.reloadData()
        itemsInfoLabel.text = "You have \(todoList.itemsCount) things"
    }
}

