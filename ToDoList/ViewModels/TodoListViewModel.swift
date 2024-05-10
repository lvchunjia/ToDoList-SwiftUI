//
//  TodoListViewModel.swift
//  ToDoList
//
//  Created by 中律十七 on 2024/5/8.
//

import Foundation

class TodoListViewModel: ObservableObject {
    @Published var todoItems: [TodoItem] = [] {
        didSet {
            saveItem()
        }
    }
    let itemKey: String = "item_list"
    
    init() {
        initTodoListItems()
    }
    
    func initTodoListItems() {
        guard let data =  UserDefaults.standard.data(forKey: itemKey), 
              let todoItemsData = try? JSONDecoder().decode([TodoItem].self, from: data)
        else { return }
        
        todoItems = todoItemsData
    }
    
    func deletdItem(indexSet: IndexSet) {
        todoItems.remove(atOffsets: indexSet)
    }

    func moveItem(fromIndexSet: IndexSet, newOffset: Int) {
        todoItems.move(fromOffsets: fromIndexSet, toOffset: newOffset)
    }
    
    func additem(title: String) {
        let item = TodoItem(title: title, isCompleted: false)
        todoItems.append(item)
    }
    
    func updateItem(item: TodoItem) {
        if let index = todoItems.firstIndex(where:{ $0.id == item.id }) {
            todoItems[index] = item.update()
        }
    }
    
    func saveItem() {
        if let data = try? JSONEncoder().encode(todoItems) {
            UserDefaults.standard.setValue(data, forKey: itemKey)
        }
    }
}
