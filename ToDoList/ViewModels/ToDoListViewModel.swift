//
//  ToDoListViewModel.swift
//  ToDoList
//
//  Created by tardisomus on 04.10.2023.
//

import FirebaseFirestore
import Foundation

class ToDoListViewModel: ObservableObject {

    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func deleteItem(itemId: String) {
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemId)
            .delete()
    }
}
