//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by tardisomus on 04.10.2023.
//

import Foundation

class ToDoListItemViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var isDone: Bool = false
    
    init() {}
    
    func toogleIsDone(item: ToDoListItem) {
        
    }
}
