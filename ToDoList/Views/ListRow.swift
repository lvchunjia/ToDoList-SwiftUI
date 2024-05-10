//
//  ListRow.swift
//  ToDoList
//
//  Created by 中律十七 on 2024/5/6.
//

import SwiftUI

struct ListRow: View {
    let item: TodoItem

    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 8)
    }
}

struct ListRow_Previews: PreviewProvider {
    static var itemOne = TodoItem(title: "This is the first todo item.", isCompleted: false)
    
    static var previews: some View {
        ListRow(item: itemOne)
            .previewLayout(.sizeThatFits)
    }
}

#Preview("ListRow Default", traits: .sizeThatFitsLayout) {
    Group {
        ListRow(item: TodoItem(title: "This is the first todo item.", isCompleted: false))
        ListRow(item: TodoItem(title: "This is the second todo item.", isCompleted: true))
    }
}
