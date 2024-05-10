//
//  TodoItem.swift
//  ToDoList
//
//  Created by 中律十七 on 2024/5/7.
//

import Foundation

struct TodoItem: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func update() -> TodoItem {
        return TodoItem(id: self.id, title: self.title, isCompleted: !self.isCompleted)
    }
}
