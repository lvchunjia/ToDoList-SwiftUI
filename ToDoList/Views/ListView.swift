//
//  ContentView.swift
//  ToDoList
//
//  Created by 中律十七 on 2024/5/6.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var viewModel: TodoListViewModel

    var body: some View {
        ZStack {
            if viewModel.todoItems.isEmpty {
                NoItemsView()
            } else {
                List {
                    ForEach(viewModel.todoItems) {item in
                        ListRow(item: item)
                            .onTapGesture {
                                viewModel.updateItem(item: item)
                            }
                    }
                    .onDelete(perform: viewModel.deletdItem)
                    .onMove(perform: viewModel.moveItem)
                }
                .listStyle(.plain)
            }
        }
        .navigationTitle("ToDo List App")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationStack {
        ListView()
    }
    .environmentObject(TodoListViewModel())
}
