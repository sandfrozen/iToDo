//
//  List.swift
//  iToDo
//
//  Created by Tomek Buslowski on 01.09.2017.
//  Copyright © 2017 Tomek Buslowski. All rights reserved.
//

import Foundation

class List {
    
    var name: String
    var todos: [String] = []
    var color: Int
    
    init(name: String) {
        self.name = name
        self.color = 0
    }
}
