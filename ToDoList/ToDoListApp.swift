//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by 中律十七 on 2024/5/6.
//

import SwiftUI

@main
struct ToDoListApp: App {
    @StateObject var viewModel = TodoListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(viewModel)
        }
    }
}
