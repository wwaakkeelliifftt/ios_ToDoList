//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by tardisomus on 04.10.2023.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem

    var body: some View {
        var date = Date(timeIntervalSince1970: item.dueDate)
            .formatted(date: .abbreviated, time: .shortened)
        
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.body)
                Text(date)
                    .font(.footnote)
//                    .foregroundColor(Color(.secondaryLabel))
                    .foregroundColor(.gray)
                    
            }
            
            Spacer()
            
            Button {
                viewModel.toogleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(
            item: .init(
                id: "123", title: "title title",
                dueDate: Date().timeIntervalSince1970,
                createdDate: Date().timeIntervalSince1970,
                isDone: false)
        )
    }
}
