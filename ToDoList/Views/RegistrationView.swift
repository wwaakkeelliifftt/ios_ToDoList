//
//  RegistrationView.swift
//  ToDoList
//
//  Created by tardisomus on 04.10.2023.
//

import SwiftUI

struct RegistrationView: View {

    @StateObject var viewModel = RegistrationVewModel()
    
    var body: some View {
        VStack {
            // header
            HeaderView(
                title: "Register",
                subtitle: "Start organizing todos",
                angle: -15,
                background: .orange
            )
                        
            // register form
            Form {
                TextField("Your name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                
                SecureField("Create password", text: $viewModel.password)
                    .textFieldStyle(PlainTextFieldStyle())
                
                TLButton(title: "Create Account", background: .green) {
                    viewModel.register()
                }
                .padding(10)
            }
            .offset(y: -50)
            
            Spacer()
        }
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
