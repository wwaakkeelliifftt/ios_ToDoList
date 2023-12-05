//
//  ToDoListItemViewModel.swift
//  ToDoList
//
//  Created by tardisomus on 04.10.2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class ToDoListItemViewModel: ObservableObject {
    
    @Published var title: String = ""
    @Published var isDone: Bool = false
    
    init() {}
    
    
    func toggleIsDone(item: ToDoListItem) {
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(newItem.id)
            .setData(newItem.asDictionary())
    }
    
}
