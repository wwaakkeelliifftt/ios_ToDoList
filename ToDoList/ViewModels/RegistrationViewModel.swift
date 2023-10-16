//
//  RegistrationViewModel.swift
//  ToDoList
//
//  Created by tardisomus on 04.10.2023.
//

import FirebaseFirestore
import FirebaseAuth
import Foundation

class RegistrationVewModel : ObservableObject {
    
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}

    func register() {
        guard validate() else {
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !name.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty
        else {
            errorMessage = "Please fill all fields"
            return false
        }
        
//        email.ranges(of: "\w+@\w+\.\w+", of)
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Check the spelling of your email"
            return false
        }
        
        guard password.count >= 6 else {
            errorMessage = "Password need to be longer"
            return false
        }

        return true
    }
    
}
